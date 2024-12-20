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
    
    let images = ["running-1", "running-2", "running-3", "running-4"]

    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                // Background color filling the entire screen
                Color.lightBlueUSA
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack {
                    
                    /*
                     Text("Game Simulation")
                     .font(.largeTitle)
                     .padding()
                     */
                    ZStack{
                        Text("Game Simulation View")
                            .font(.largeTitle)

                    }
                    
                    if intensity == 5{
                        Image("grave")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        HStack{
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.red)
                            Text("Warning:")
                                .font(.custom("Futura", size: 24))
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                        }
                        Text("Devolpers Do Not Take Responsiblity for Death")
                            .font(.custom("Futura", size: 24))
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                        
                    } else {
                        Image(images[currentImageIndex])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        Spacer()
                                    
                    }
                    
                    Text("Intensity") // Display current intensity as an integer
                        .font(.custom("Futura", size: 24))
                        .foregroundColor(.white)
                    
                    
                    
                    BouncingSlider(value: $intensity)
                        .padding(.horizontal, 30)
                    
                    NavigationLink(destination: PlayView(intensity: Int(intensity))){
                        Text("Play at Intensity \(Int(intensity))")
                            .font(.custom("Futura", size: 24))
                            .padding()
                            .background(Color.redUSA)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.darkBlueUSA, lineWidth: 5)
                            )
                            .padding()
                    }
                    
                    // Button to navigate to TutorialView
                    NavigationLink(destination: TutorialView()){
                        Text("Tutorial")
                            .font(.custom("Futura", size: 24))
                            .padding()
                            .background(Color.darkBlueUSA)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.midBlueUSA, lineWidth: 5)
                            )
                    }
                    
                    Spacer()
                }
                .onAppear{
                    startTimer()
                }.onChange(of: intensity) {
                    startTimer() // Restart timer when intensity changes
                }
                .onDisappear {
                    timer?.invalidate() // Stop the timer when view disappears
                }
               
                .navigationTitle("Game Simulation")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }

    func startTimer() {
            // Invalidate any existing timer
            timer?.invalidate()
            
            // Set the timer speed based on intensity
            switch intensity {
            case 1:
                timerSpeed = 0.7
            case 2:
                timerSpeed = 0.5
            case 3:
                timerSpeed = 0.3
            case 4:
                timerSpeed = 0.1
            default:
                timerSpeed = 0.7 // Fallback value
            }
            
            // Schedule a new timer
            timer = Timer.scheduledTimer(withTimeInterval: timerSpeed, repeats: true) { _ in
                // Update the index to the next image
                currentImageIndex = (currentImageIndex + 1) % images.count
            }
    }
}

#Preview {
    GameSimulationView()
}
