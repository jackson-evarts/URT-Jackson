//
//  PlayView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/25/24.
//

import SwiftUI
import AVFoundation
import Combine



struct PlayView: View {
    
    var intensity: Int
    @State private var backgroundColor: Color = .clear // Initialize with a default value (e.g., .clear)
    @Environment(\.dismiss) var dismiss // Used to help navigate back on triple click
    
    @EnvironmentObject var audioTimerManager: GlobalAudioTimerManager // Access global manager
    
    
    var body: some View {
        ZStack{
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack{
                
                var formattedTime: String {
                    let minutes = audioTimerManager.elapsedTime / 60
                    let seconds = audioTimerManager.elapsedTime % 60
                    return String(format: "%02d:%02d", minutes, seconds) // Format as MM:SS
                }
                
                Text("Elapsed Time: \(formattedTime)")
                    .foregroundColor(.white)
                    .font(.custom("Futura", size:20))
                
                
                Text("Triple Tap to Return to Menu")
                    .foregroundColor(.white)
                    .font(.custom("Futura", size:20))
                
                
                Text("Intensity: \(intensity)")
                    .foregroundColor(.white)
                    .font(.custom("Futura", size:20))
                
            }
            
        }
        .onAppear {
            
            
            // Start the timer immediately as the screen is brought up
            audioTimerManager.startTimer()
            
            // Initialize the audio session
            audioTimerManager.setupAudioSession()
            
            // Building the game and calling eventManagement function to play audios
            let gameList = buildGame(intensity: intensity)
            eventManagement(gameEvents: gameList)
            print("The game: \(gameList)")
            
            // Animate the color change to black when the view appears
            backgroundColor = Color.lightGrey
            withAnimation(.easeInOut(duration: 3)) {
                backgroundColor = Color.black
            }
            
            
            
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture(count: 3) { // Detect triple tap
            dismiss() // Navigate back on triple tap
            audioTimerManager.stopTimer()
            audioTimerManager.elapsedTime = -5
        }
        
        
        .onDisappear(){ // Timer stops when the view is put away
            audioTimerManager.stopTimer()
        }
    }
    
    
    
    
    /*
     Precondition:
     ???
     =====
     Postcondition:
     Each time the timer hits a time that is in the gameEvents array, I want the program to play the correlated sound associated with the string that is in the gameEvents array.
     
     */
    func eventManagement(gameEvents: [(Int, String)]) {
        var gameEventIndex = 0
        
        // Start a timer to check elapsedTime periodically
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let currentTime = audioTimerManager.elapsedTime
            
            // If all events are processed, invalidate the timer
            if gameEventIndex >= gameEvents.count {
                audioTimerManager.stopTimer()
                return
            }
            
            // Get the next event from the gameEvents array
            let nextEvent = gameEvents[gameEventIndex]
            
            // Check if the elapsed time matches the event time
            if currentTime >= nextEvent.0 {
                // Play the audio based on the event type
                
                print("\(nextEvent) sound playing at \(currentTime).")
                audioTimerManager.playSound(sound: nextEvent.1)
                
                // Move to the next event in the array
                gameEventIndex += 1
            }
        }
    }
    
    /*
     Precondition:
     The user has selected an intensity level (1-5) which is passed to this function as they click 'Play'
     =====
     Postcondition:
     The function returns a list of tupils of type (Int, String) which represent timestamps of events in the game timeline such as the kickoff: (0, 'Kickoff')
     Possible events include: DefensiveLinebreak, Fulltime, Halftime, Kickoff, Lineout, OffensiveLinebreak, Scrum, Tackle, TacklePoach, Try
     Events should be random order besides these rules
     
     Rules:
     Tries only occur after offensive or defensive linebreaks
     Tackles 2-5 seconds after offensive linebreaks
     TacklePoach 2-5 after defensive linebreaks
     Kickoff 30 seconds after a try is scored, unless that carries into Halftime
     Kickoff 1 minute after Halftime
     Fulltime at 900
     Kickoff at 0
     Halftime at 420
     Kickoff for second half at 480
     
     
     =====
     Author:
     Jackson Evarts
     */
    func buildGame(intensity: Int) -> [(Int, String)] {
        var defensiveLinebreaks = 4
        var scrums = 6
        var lineouts = 2
        var offensiveLinebreaks = 4
        let totalTries = Int.random(in: 2...6)  // Randomize number of tries
        
        switch intensity {
        case 1:
            defensiveLinebreaks -= 3
            scrums += 3
            lineouts += 2
            offensiveLinebreaks -= 2
        case 2:
            defensiveLinebreaks -= 2
            scrums += 2
            lineouts += 1
            offensiveLinebreaks -= 1
        case 4:
            defensiveLinebreaks += 2
            scrums -= 1
            lineouts -= 1
            offensiveLinebreaks += 2
        case 5:
            defensiveLinebreaks += 3
            scrums -= 2
            lineouts -= 1
            offensiveLinebreaks += 3
        default:
            break
        }
        
        var timeline: [(Int, String)] = [(0, "Kickoff")]
        var currentTime = 0
        let avgInterval = 420 / (defensiveLinebreaks + scrums + lineouts + offensiveLinebreaks)
        
        // Function to add events with optional delay
        func addEvent(_ event: String, delay: Int = 0) {
            currentTime += delay
            timeline.append((currentTime, event))
        }
        
        // Calculate rough intervals for try events throughout the game
        let tryIntervals = 900 / (totalTries + 1) // Divides game time into segments for tries
        var nextTryTime = tryIntervals
        
        // Randomized event types excluding ordered ones
        let baseEvents = Array(repeating: "Scrum", count: scrums) +
        Array(repeating: "Lineout", count: lineouts)
        var randomizedEvents = baseEvents.shuffled() // Randomize non-specific events
        
        // First half events with ordered linebreak rules
        for _ in 1...defensiveLinebreaks {
            addEvent("DefensiveLinebreak", delay: Int.random(in: avgInterval - 10...avgInterval + 10))
            addEvent("TacklePoach", delay: Int.random(in: 2...5))
            
            if currentTime >= nextTryTime && totalTries > 0 {
                addEvent("Try", delay: Int.random(in: 2...5))
                nextTryTime += tryIntervals
            }
        }
        
        for _ in 1...offensiveLinebreaks {
            addEvent("OffensiveLinebreak", delay: Int.random(in: avgInterval - 10...avgInterval + 10))
            addEvent("Tackle", delay: Int.random(in: 2...5))
            
            if currentTime >= nextTryTime && totalTries > 0 {
                addEvent("Try", delay: Int.random(in: 2...5))
                nextTryTime += tryIntervals
            }
        }
        
        // Insert remaining randomized events in the first half
        for event in randomizedEvents.prefix(randomizedEvents.count / 2) {
            addEvent(event, delay: Int.random(in: avgInterval - 10...avgInterval + 10))
        }
        
        addEvent("Halftime", delay: 420 - currentTime) // Ensure halftime at 420 seconds
        addEvent("Kickoff", delay: 60) // Start second half at 480 seconds
        
        // Reset currentTime for second half
        currentTime = 480
        randomizedEvents = randomizedEvents.suffix(randomizedEvents.count / 2).shuffled() // Shuffle again for second half
        
        // Second half events
        for _ in 1...defensiveLinebreaks {
            addEvent("DefensiveLinebreak", delay: Int.random(in: avgInterval - 10...avgInterval + 10))
            addEvent("TacklePoach", delay: Int.random(in: 2...5))
            
            if currentTime >= nextTryTime && totalTries > 0 {
                addEvent("Try", delay: Int.random(in: 2...5))
                nextTryTime += tryIntervals
            }
        }
        
        for _ in 1...offensiveLinebreaks {
            addEvent("OffensiveLinebreak", delay: Int.random(in: avgInterval - 10...avgInterval + 10))
            addEvent("Tackle", delay: Int.random(in: 2...5))
            
            if currentTime >= nextTryTime && totalTries > 0 {
                addEvent("Try", delay: Int.random(in: 2...5))
                nextTryTime += tryIntervals
            }
        }
        
        // Insert remaining randomized events in the second half
        for event in randomizedEvents {
            addEvent(event, delay: Int.random(in: avgInterval - 10...avgInterval + 10))
        }
        
        addEvent("Full-time", delay: 900 - currentTime) // Ensure full-time at 900 seconds
        
        return timeline.sorted { $0.0 < $1.0 }
    }
    
    
    
}

#Preview {
    PlayView(intensity: 3)
        .environmentObject(GlobalAudioTimerManager()) // Provide the environment object for preview
    
}
