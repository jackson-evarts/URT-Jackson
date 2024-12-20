//
//  GameSimulationView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

/*
 Author: Jackson Evarts w/ ChatGPT circa 2024-10-03
 */
 

struct GameSimulationView: View {
    @State private var intensity: Double = 1.0
    @State private var currentImageIndex = 0
    @State private var timer: Timer?
    @State var timerSpeed: Double = 1.0
    

    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                // Background color filling the entire screen
                Color.lightGrey
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack(spacing: 20) {
                    Text("Game Simulation View")
                        .font(.custom("Futura", size: 30))
                        .foregroundColor(.primaryGold)
                        .padding()

                    // TODO: ADD A CLEAN GRAPHIC FOR THE INTENSITY
                    Spacer()
                    
                    Text("Intensity")
                        .font(.custom("Futura", size: 24))
                        .foregroundColor(.darkGrey)

                    BouncingSlider(value: $intensity)
                        .padding(.horizontal, 30)
                    
                    NavigationLink(destination: PlayView(intensity: Int(intensity))) {
                        Text("Play at Intensity \(Int(intensity))")
                            .font(.custom("Futura", size: 24))
                            .padding()
                            .background(Color.primaryGold)
                            .foregroundColor(.lightGrey)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.charcoalGrey, lineWidth: 5)
                            )
                            .padding()
                    }
                    
                    NavigationLink(destination: TutorialView()) {
                        Text("Tutorial")
                            .font(.custom("Futura", size: 24))
                            .padding()
                            .background(Color.darkGrey)
                            .foregroundColor(.lightGrey)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.charcoalGrey, lineWidth: 5)
                            )
                    }
                    
                    Spacer()
                }
                .navigationTitle("Game Simulation")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

}

#Preview {
    GameSimulationView()
}
