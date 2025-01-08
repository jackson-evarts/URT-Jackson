//
//  BroncoWorkoutPlayView.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/4/25.
//

import SwiftUI

struct BroncoWorkoutPlayView: View {
    let selectedWorkout: String
    // TODO: [Idea] Switch that you can choose to have the stopwatch vertical or horizontal on the screen. This should be remembered by the app so the user only changes it once and then it is forever stored by the app as a default.
    
    @State private var backgroundColor: Color = .lightGrey // Initialize with a default value (e.g., .clear)
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
                Spacer()
                
                Text("Elapsed Time:")
                    .foregroundColor(.white)
                    .font(.custom("Futura", size:20))
                Text("\(formattedTime)")
                    .foregroundColor(.white)
                    .font(.custom("Futura-Bold", size:120))
                
                Spacer()
                
                Text("Triple Tap to Return to Menu")
                    .foregroundColor(.white)
                    .font(.custom("Futura", size:20))
                
                Text("Selected workout: \(selectedWorkout)")
                    .foregroundColor(Color.white)
                    .font(.custom("Futura", size:20))
                    .padding(.bottom)
                
                
                
            }
        }
        .onAppear{
            
            // Start the timer immediately as the screen is brought up
            audioTimerManager.startTimer()
            
            let list = buildWorkout(workout: selectedWorkout)
            eventManagement(workoutEvents: list)
            print("Workout list build: \n\(buildWorkout(workout: selectedWorkout))")
            
            
            // Initialize the audio session
            audioTimerManager.setupAudioSession()
            
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
     Function is passed a valid workout build with the format X-X-...-X where X are integers indicating a number of bronco legs to run in that phase of the workout.
     =====
     Postcondition:
     Function returns a list of tuples of type (Int, String) which represents the timestamps of events in the workout for when and what the app should be announcing. Counting the player into their next leg of the workout, or giving the starting beep.
     If the workout is "1-2" for example, the buildWorkout would look like follows:
     [(0, "Beep"), (60, "60s"), (80, "40s"), (90, "30s"), (100, "20s"), (110, "10s"), (115, "5s-0s"), (120, "Beep"), (240, "60s") ... (360, "Beep")]
     */
    func buildWorkout(workout: String) -> [(Int, String)] {
        
        var finalList = [(0, "Beep")]
        var traceTime = 0
        
        // Converts a workout string (e.g., "1-1-2") to an array of integers [1, 1, 2]
        func stringToIntArray(_ input: String) -> [Int] {
            return input
                .split(separator: "-") // Split the string by "-"
                .compactMap { Int($0) } // Convert each substring to Int, skipping invalid ones
        }
        
        func buildCountdown(_ list: inout [(Int, String)], startTime: Int){
            list.append((startTime, "60s"))
            list.append((startTime + 20, "40s"))
            list.append((startTime + 30, "30s"))
            list.append((startTime + 40, "20s"))
            list.append((startTime + 50, "10s"))
            list.append((startTime + 55, "5s-1s"))
            list.append((startTime + 60, "Beep"))
        }
        // TODO: [Bug] The final 60s rest shouldn't really have a countdown because it's not counting down to anything.
        
        let workoutGuideArray = stringToIntArray(workout)
        
        
        for legs in workoutGuideArray {
            
            // Workout time. User should be running for ~this amount of time
            traceTime += legs * 60
            
            // Passing finalList by reference for buildCounter to append countdown items to list
            buildCountdown(&finalList, startTime: traceTime)
            traceTime += 60 // Updating the traceTime to after the rest time countdown.
            
            
        }
        
        return finalList
    }
    
    // TODO: [Code Improvement] This function is identical to the PlayView version except this one doesn't have sounds implemented yet. Look for opportunity for code reusability once the audios are done.
    /*
     Precondition:

     =====
     Postcondition:
     Each time the timer hits a time that is in the workoutEvents array, the program will play the correlated sound associated with the string that is in the workoutEvents array.
     */
    func eventManagement(workoutEvents: [(Int, String)]) {
        var workoutEventIndex = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let currentTime = audioTimerManager.elapsedTime
            
            // If the time is >= the time of the last event
            if workoutEventIndex >= workoutEvents.count {
                audioTimerManager.stopTimer()
                timer.invalidate()
                return
            }
            
            let nextEvent = workoutEvents[workoutEventIndex]
            
            
            // Check if the elapsed time matches the event time
            if currentTime >= nextEvent.0 {
                
                // Play the audio based on the event type
                print("\(nextEvent) sound playing at \(currentTime).")
                // TODO: [Incomplete Feature] Uncomment the below line once the new sounds are imported to assets
                //audioTimerManager.playSound(sound: nextEvent.1)
                
                // Move to the next event in the array
                workoutEventIndex += 1
            }
        }
    }
    
}

#Preview {
    BroncoWorkoutPlayView(selectedWorkout: "1-1-1-1-1-1")
        .environmentObject(GlobalAudioTimerManager()) // Provide the environment object for preview
    
}
