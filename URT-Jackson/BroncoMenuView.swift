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
                    
                    // TODO: Move this whole menu into the bronco workouts area and change it from BroncoMenuViewLogic into just the normal area. Need the selection to be avaliable on the WorkoutView.
                    BroncoMenu()
                    
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
