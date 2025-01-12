//
//  BroncoWorkoutSummaryView.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/11/25.
//

import SwiftUI

// TODO: [Necessary Feature] Fix this nasty ass screen tbh

struct BroncoWorkoutSummaryView: View {
    let splits: [String]
    @Environment(\.dismiss) var dismiss // Used to help navigate back on triple click


    var body: some View {
        VStack {
            Text("Workout Summary")
                .font(.custom("Futura-Bold", size: 30))
                .padding()

            List(splits, id: \.self) { split in
                Text(split)
                    .font(.custom("Futura", size: 20))
                    .padding(.vertical, 5)
            }

            // TODO: [Fix] Make this button sexy and functional. Maybe it should work kind of like spotify's share button where it pops up with the option to save the image somewhere? Far out idea.
            
            Button(action: {
                // Handle share or save logic here
            }) {
                Text("Share Your Splits!")
                    .font(.custom("Futura", size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            // TODO: [Feature] Implement "Return to Bronco Workout Selection". Maybe do this thorugh a double dismiss?
            
            
        }
        .padding()
        .navigationBarTitle("Good Job!", displayMode: .inline)
    }
}


#Preview {
    BroncoWorkoutSummaryView(splits: ["00:50","00:43","00:51","00:43","1:02"])
        .environmentObject(GlobalAudioTimerManager())
}
