//
//  ContentView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct ContentView: View {

    /*
     Color Scheme:
     Color.white
     Color.lightBlueUSA
     Color.midBlueUSA
     Color.darkBlueUSA
     Color.redUSA
     */
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color filling the entire screen
                Color.lightBlueUSA // Background color
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack {
                    
                    // Display the image
                    ZStack{
                        // TODO: Title
                        Text("Title")
                            .font(.custom("Futura", size: 24))

                    }
                        
                    Image("Rugby Ball")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                    
                    
                    // Settings Button
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                            .font(.custom("Futura", size: 24))

                    }
                    
                    
                    
                    // Game Simulation Button
                    NavigationLink(destination: GameSimulationView()) {
                        Text("Game Simulation")
                            .font(.custom("Futura", size: 24))

                        
                    }
                    
                    // TODO: Bronco Trainer Button (disabled)
                    Spacer()
                    
                    
                }
                .padding() // Add padding to avoid content getting too close to the edges
            }
            .navigationTitle("Ultimate Rugby Trainer")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}


#Preview {
    ContentView()
}
