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
    @State private var intensity: Double = 3.0
    @State private var currentImageIndex = 0
    @State private var timer: Timer?
    @State var timerSpeed: Double = 1.0
    @State private var showTip: Bool = false // State for showing the tip
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color filling the entire screen
                Color.lightGrey
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack(spacing: 20) {
                    Spacer()
                    TitlePage(title: "Game Simulation")
                    
                    Spacer()
                    Image("Posts")
                        .resizable() // Allows resizing of the image
                        .aspectRatio(contentMode: .fit) // Maintains the aspect ratio while fitting within the bounds
                        .frame(maxWidth: 200, maxHeight: 200) // Sets a reasonable size limit for the image
                        .frame(maxWidth: .infinity) // Ensures the image is centered horizontally
                    
                    Text("Intensity")
                        .font(.custom("Futura", size: 24))
                        .foregroundColor(.darkGrey)
                    
                    BouncingSlider(value: $intensity)
                        .padding(.horizontal, 30)
                    
                    CustomNavButton(
                        text: "Play at Intensity \(Int(intensity))",
                        destination: PlayView(intensity: Int(intensity))
                    )
                    
                    CustomNavButton(
                        text: "Tutorial",
                        destination: TutorialView()
                    )
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            // Show the tip only if it's the first time
            if !UserDefaults.standard.bool(forKey: "hasSeenGameSimulationTip") {
                showTip = true
                UserDefaults.standard.set(true, forKey: "hasSeenGameSimulationTip")
            }
        }
        .sheet(isPresented: $showTip) {
            ZStack {
                // Full-screen background color
                Color.lightGrey
                    .edgesIgnoringSafeArea(.all) // Ensures the color fills the entire sheet
                
                // Content of the sheet
                VStack(spacing: 20) {
                    Text("Tip!")
                        .font(.custom("Futura-Bold", size: 30))
                        .foregroundColor(.primaryGold)
                    
                    Text("Check out the tutorial for gameplay instruction and helpful training tips!")
                        .font(.custom("Futura", size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.darkGrey)
                        .padding()
                    
                    Button(action: {
                        showTip = false
                    }) {
                        Text("Got it!")
                            .font(.custom("Futura", size: 20))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryGold)
                            .foregroundColor(.lightGrey)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
        }
        
    }
}

#Preview {
    GameSimulationView()
}
