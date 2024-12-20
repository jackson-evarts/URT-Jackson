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
                    Spacer()
                    
                    // Display the image
                    Text("The\nUltimate Rugby Trainer")
                                .font(.custom("Futura-Bold", size: 25))
                                .foregroundColor(.primaryGold)
                                .multilineTextAlignment(.center) // Center-align text
                                .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
                    Spacer()
                    Image("Cap")
                        .resizable() // Allows resizing of the image
                        .aspectRatio(contentMode: .fit) // Maintains the aspect ratio while fitting within the bounds
                        .frame(maxWidth: 200, maxHeight: 200) // Sets a reasonable size limit for the image
                        .frame(maxWidth: .infinity) // Ensures the image is centered horizontally

                    
                    
                    CustomNavButton(
                        text: "Settings",
                        destination: SettingsView()
                    )
                    
                    CustomNavButton(
                        text: "Game Simulation",
                        destination: GameSimulationView()
                    )
                    
                    


                    // TODO: Bronco Trainer Button (disabled)
                    Spacer()
                }
                .padding() // Add padding to avoid content getting too close to the edges
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
