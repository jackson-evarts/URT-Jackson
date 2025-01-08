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
                Text("Selected workout: \(selectedWorkout)")
                    .foregroundColor(Color.white)
                Text("Triple Tap to Return to Menu")
                    .foregroundColor(.white)
                    .font(.custom("Futura", size:20))
                
            }
        }
        .onAppear{
            
            // Start the timer immediately as the screen is brought up
            audioTimerManager.startTimer()
            
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
        
}

#Preview {
    BroncoWorkoutPlayView(selectedWorkout: "1-1-1-1-1-1")
        .environmentObject(GlobalAudioTimerManager()) // Provide the environment object for preview

}
