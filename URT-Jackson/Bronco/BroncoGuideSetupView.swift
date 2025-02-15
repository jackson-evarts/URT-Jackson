//
//  BroncoGuideSetupView.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/4/25.
//

import SwiftUI

struct BroncoGuideSetupView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack{
            Color.lightGrey // Background color
                .edgesIgnoringSafeArea(.all) // Fill entire background
            VStack{
                Spacer()
                Image("Construction")
                    .resizable() // Allows resizing of the image
                    .aspectRatio(contentMode: .fit) // Maintains the aspect ratio while fitting within the bounds
                    .frame(maxWidth: 200, maxHeight: 200) // Sets a reasonable size limit for the image
                    .frame(maxWidth: .infinity) // Ensures the image is centered horizontally
                
                JustifiedText(text: "This feature is under development.")
                Spacer()
                BackButton(text: "Return to Bronco Menu", path: $path)
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    BroncoGuideSetupView(path: .constant(NavigationPath()))
}
