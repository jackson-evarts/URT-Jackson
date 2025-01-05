//
//  BroncoWorkoutPlayView.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/4/25.
//

import SwiftUI

struct BroncoWorkoutPlayView: View {
    let selectedWorkout: String
    // TODO: Switch that you can choose to have the stopwatch vertical or horizontal on the screen. This should be remembered by the app so the user only changes it once and then it is forever stored by the app as a default. 
    
    var body: some View {
        ZStack{
            
            VStack{
                Text("Selected workout: \(selectedWorkout)")
                
            }
        }
    }
}

#Preview {
    BroncoWorkoutPlayView(selectedWorkout: "1-1-1-1-1-1 (6 legs)")
}
