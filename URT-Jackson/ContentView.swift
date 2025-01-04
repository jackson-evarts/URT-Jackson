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
                    
                    TitlePage(title: "The\nUltimate Rugby Trainer")
                    
                    Spacer()
                    
                    Image("Cap")
                        .resizable() // Allows resizing of the image
                        .aspectRatio(contentMode: .fit) // Maintains the aspect ratio while fitting within the bounds
                        .frame(maxWidth: 200, maxHeight: 200) // Sets a reasonable size limit for the image
                        .frame(maxWidth: .infinity) // Ensures the image is centered horizontally

                    Spacer()
                    
                    /*
                    CustomNavButton(
                        text: "Settings",
                        destination: SettingsView()
                    )
                     */
                    
                    
                    CustomNavButton(
                        text: "Game Simulation",
                        destination: GameSimulationView()
                    )
                    
                    CustomNavButton(
                        text: "Bronco Menu",
                        destination: BroncoMenuView()
                    )


                    Spacer()
                }
            }
            .navigationTitle("")
        }
        .tint(.primaryGold) // Set the tint color for navigation elements

    }
}

#Preview {
    ContentView()
}
