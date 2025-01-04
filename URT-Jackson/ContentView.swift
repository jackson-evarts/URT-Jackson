//
//  ContentView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationPath = NavigationPath()

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
                    
                    /*
                     // TODO: Decide if I need this for navigatino path stuff
                    Button{
                        navigationPath.append("GameSimulation")
                        
                        
                        
                    } label: {
                        Text("text")
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
            /*
             // TODO: Decide if I need to do all this extra navigation stuff
            .navigationDestination(for: String.self) { value in
                switch value {
                case "GameSimulation":
                    GameSimulationView(navigationPath: $navigationPath)
                default:
                    EmptyView()
                }
            }
             */
            .navigationTitle("")
        }
        .tint(.primaryGold) // Set the tint color for navigation elements

    }
}

#Preview {
    ContentView()
}
