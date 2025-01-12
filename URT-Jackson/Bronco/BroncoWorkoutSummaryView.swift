//
//  BroncoWorkoutSummaryView.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/11/25.
//

import SwiftUI

struct BroncoWorkoutSummaryView: View {
    let splits: [String]
    @Environment(\.dismiss) var dismiss // Used to help navigate back on triple click
    let workout: String

    var body: some View {
        
        ZStack{
            
            Color.lightGrey // Background color
                .edgesIgnoringSafeArea(.all) // Fill entire background

            VStack {
                TitlePage(title: "Workout Summary")
                List(splits, id: \.self) { split in
                    Text(split)
                        .font(.custom("Futura", size: 20))
                        .padding(.vertical, 5)
                }
                .padding(.top)
                
                
                Button(action: {
                    // TODO: [Bug] I need to use the NavigationPath stuff in order to remove two screens 😪 I guess it's time for me to finally figure this shit out smh
                    dismiss()
                    dismiss()
                }) {
                    Text("Return to Workout Selection")
                        .font(.custom("Futura", size: 24))
                        .foregroundColor(.lightGrey)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryGold)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.charcoalGrey, lineWidth: 5)
                        )
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.05) // Dynamic horizontal padding
                }
                .padding(.bottom)
                
                // TODO: [Feature] Make this share button sexy and functional. Maybe it should work kind of like spotify's share button where it pops up with the option to save the image somewhere? Far out idea.
                /*
                Button(action: {
                    // Handle share or save logic here
                }) {
                    Text("Share Your Splits!")
                        .font(.custom("Futura", size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                */
                                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Good Job!", displayMode: .inline)
    }
}


#Preview {
    BroncoWorkoutSummaryView(splits: ["00:50","00:43","00:51","00:43","1:02"], workout: "1-1-1-1-1")
        .environmentObject(GlobalAudioTimerManager())
}
