//
//  BroncoMenuView.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 12/20/24.
//

import SwiftUI

struct BroncoMenuView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                // Background color filling the entire screen
                Color.lightGrey // Background color
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                VStack{
                    Spacer()
                    
                    TitlePage(title: "Bronco Menu")
                        .padding()
                    Spacer()
                    
                    Image("Bronco")
                        .resizable() // Allows resizing of the image
                        .aspectRatio(contentMode: .fit) // Maintains the aspect ratio while fitting within the bounds
                        .frame(maxWidth: 200, maxHeight: 200) // Sets a reasonable size limit for the image
                        .frame(maxWidth: .infinity) // Ensures the image is centered horizontally

                    Spacer()
                    
                    CustomNavButton(
                        text: "Bronco Workouts",
                        destination: BroncoWorkoutsView()
                    )
                    
                    BroncoMenu(menuItems: [
                        "1-1-1-1-1-1-1-1-1-1 (10 legs)",
                        "1-1-1-1-1-1 (6 legs)",
                        "2-2-1-1",
                        "3-2"
                    ])
                    
                }
            }
            .navigationTitle("")
        }
        .tint(.primaryGold) // Set the tint color for navigation elements

    }

}

#Preview {
    BroncoMenuView()
}
