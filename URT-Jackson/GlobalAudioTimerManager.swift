//
//  GlobalAudioTimerManager.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/4/25.
//

import Foundation
import AVFoundation
import Combine

// Manages a global audio player and timer that can be accessed across the app.
class GlobalAudioTimerManager: ObservableObject {
    @Published var audioPlayer: AVAudioPlayer?
    @Published var timer: Timer?
    @Published var elapsedTime: Int = 0
    
    /*
     Precondition:
     --
     =====
     Postcondition:
     Audio is setup to play in the background and duck other audio
     */
    func setupAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, options: [.mixWithOthers, .duckOthers])
            try audioSession.setActive(true)
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
    }
    
    /*
     Precondition:
     The passed variable "sound" is a valid .m4a file inside the app folder.
     =====
     Postcondition:
     The correlated audio to the details passed is played for the user.
     =====
     Author:
     Jackson Evarts
     */
    func playSound(sound: String, type: String = "m4a") {
         if let path = Bundle.main.path(forResource: sound, ofType: type) {
             let url = URL(fileURLWithPath: path)
             do {
                 audioPlayer = try AVAudioPlayer(contentsOf: url)
                 audioPlayer?.play()
                 print("\(sound) sound is playing.")
             } catch {
                 print("Error playing sound: \(error.localizedDescription)")
             }
         } else {
             print("Sound file not found: \(sound).\(type)")
         }
     }
    
    // Starts the global timer.
    func startTimer() {
        stopTimer() // Ensure no duplicate timers
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.elapsedTime += 1
        }
    }
    
    // Stops the global timer.
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
