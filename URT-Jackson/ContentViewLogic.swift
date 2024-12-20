//
//  ContentViewManager.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 10/9/24.
//

import Foundation
import SwiftUI
import AVFoundation

struct TitlePage: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.custom("Futura-Bold", size: 25))
            .foregroundColor(.primaryGold)
            .multilineTextAlignment(.center) // Center-align text
            .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
    }
}


struct FullWidthTextStripe: View {
    var text: String

    var body: some View {
        let backgroundColor: Color = .primaryGold // Default background color
        let textColor: Color = .white // Predefined text color for readability

        ZStack {
            Rectangle()
                .fill(backgroundColor)
                .frame(maxWidth: .infinity) // Spans full width
                .frame(height: 60) // Fixed height
                .edgesIgnoringSafeArea(.horizontal)

            Text(text)
                .font(.custom("Futura-Bold", size: 18))
                .foregroundColor(textColor)
                .multilineTextAlignment(.center)
        }
    }
}

struct JustifiedText: View {
    var text: String // Single block of text

    var body: some View {
        Text(text)
            .font(.custom("Futura", size: 20))
            .multilineTextAlignment(.leading) // Justifies the text
            .padding(.horizontal, 20) // Pads off the sides of the screen
            .lineLimit(nil) // Ensures no truncation
        
    }
}

struct CustomNavButton<Destination: View>: View {
    let text: String
    let destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            Text(text)
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
    }
}
