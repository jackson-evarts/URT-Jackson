//
//  SettingsView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 10/3/24.
//

import SwiftUI

extension Color {
    static let primaryGold = Color(hex: "#DAA520") // Goldenrod
    static let softGold = Color(hex: "#FFD700")    // Gold
    static let mutedGold = Color(hex: "#B8860B")   // Dark Goldenrod

    static let lightGrey = Color(hex: "#F5F5F5")   // White Smoke
    static let neutralGrey = Color(hex: "#D3D3D3") // Light Grey
    static let darkGrey = Color(hex: "#696969")    // Dim Grey
    static let charcoalGrey = Color(hex: "#333333") // Dark Grey

    // Helper initializer for HEX values
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

struct SettingsView: View {
    
    var body: some View {
        ZStack{
            Color.lightGrey // Background color
                .edgesIgnoringSafeArea(.all) // Fill entire background
            
            VStack{
                
                
            }
        }
    }
    
    
}



#Preview {
    SettingsView()
}
