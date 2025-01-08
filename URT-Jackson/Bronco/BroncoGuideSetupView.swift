//
//  BroncoGuideSetupView.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/4/25.
//

import SwiftUI

struct BroncoGuideSetupView: View {
    var body: some View {
        ZStack{
            Color.lightGrey // Background color
                .edgesIgnoringSafeArea(.all) // Fill entire background
            VStack{
                Spacer()
                Text("This feature is coming soon!")
                Spacer()
                BackButton(text: "Return to Bronco Menu")
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    BroncoGuideSetupView()
}
