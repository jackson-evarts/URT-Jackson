//
//  ContentView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                // Background color filling the entire screen
                Color.lightGrey // Background color
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack(spacing: 20) {
                    // Display the image
                    Text("The Ultimate Rugby Trainer")
                        .font(.custom("Futura", size: 24))
                        .foregroundColor(.primaryGold) // Title text color
                        .padding()

                    // TODO: ADD RUGBY GRAPHIC HERE; maybe clean posts?
                    Spacer()

                    // Settings Button
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                            .font(.custom("Futura", size: 24))
                            .foregroundColor(.lightGrey)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryGold)
                            .cornerRadius(10)
                    }

                    // Game Simulation Button
                    NavigationLink(destination: GameSimulationView()) {
                        Text("Game Simulation")
                            .font(.custom("Futura", size: 24))
                            .foregroundColor(.lightGrey)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryGold)
                            .cornerRadius(10)
                    }

                    // TODO: Bronco Trainer Button (disabled)
                    Spacer()
                }
                .padding() // Add padding to avoid content getting too close to the edges
            }
            .navigationTitle("Main Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
