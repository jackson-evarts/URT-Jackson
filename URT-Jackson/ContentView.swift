//
//  ContentView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var audioTimerManager = GlobalAudioTimerManager()
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color filling the entire screen
                Color.lightGrey // Background color
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack {
                    Spacer()
                    
                    TitlePage(title: "The", fontSize: 17)
                        .padding(.bottom, -15)
                    TitlePage(title: "Ultimate Rugby Trainer")
                    
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
                    .padding(.vertical)
                    
                    CustomNavButton(
                        text: "Bronco Menu",
                        destination: BroncoMenuView()
                    )
                    
                    
                    Spacer()
                    
                    Text("Developed by Jackson Evarts")
                        .font(.custom("Futura", size: 12))
                        .foregroundColor(.charcoalGrey)
                    
                } // End VStack
                
                
            } // End ZStack
            .navigationTitle("")
        } // End NavStack
        .tint(.primaryGold) // Set the tint color for navigation elementsf

    } // End View
} // End ContentView

#Preview {
    ContentView()
        .environmentObject(GlobalAudioTimerManager()) // Inject GlobalAudioTimerManager

}
