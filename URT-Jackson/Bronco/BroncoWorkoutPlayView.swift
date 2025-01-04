//
//  BroncoWorkoutPlayView.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/4/25.
//

import SwiftUI

struct BroncoWorkoutPlayView: View {
    let selectedWorkout: String

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
