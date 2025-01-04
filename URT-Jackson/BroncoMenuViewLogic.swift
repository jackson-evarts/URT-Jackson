//
//  BroncoMenuViewLogic.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/4/25.
//

import Foundation
import SwiftUI

struct BroncoMenu: View {
    let menuItems: [String] // List of menu items
    
    @State private var selectedIndex: Int = 0 // Track the selected index
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {

                // Static Menu Items (Visible list)
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(menuItems.indices, id: \.self) { index in
                        Text(menuItems[index])
                            .font(.custom("Futura", size: 20))
                            .foregroundColor(Color.primaryGold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 30)
                    }
                }
                
                // Moving Arrow Indicator
                VStack {
                    ForEach(menuItems.indices, id: \.self) { index in
                        if index == selectedIndex {
                            HStack {
                                // Arrow positioned to the left of each item
                                Image(systemName: "arrowtriangle.right.fill")
                                    .foregroundColor(Color.charcoalGrey)
                                    .font(.system(size: 20))
                                    .animation(.easeInOut(duration: 0.3), value: selectedIndex)
                                Spacer()
                            }
                        } else {
                            Spacer()
                                .frame(height: 45) // Match the height of each row
                        }
                    }
                }
            }
            .padding()
            .cornerRadius(10)
            .frame(maxWidth: .infinity, maxHeight: 300)
            
            // Controls for Arrow Movement
            HStack(spacing: 60) {
                Button(action: {
                    withAnimation {
                        if selectedIndex > 0 {
                            selectedIndex -= 1
                        }
                    }
                }) {
                    Image(systemName: "chevron.up")
                        .font(.system(size: 24))
                        .foregroundColor(Color.charcoalGrey)
                }
                
                Button(action: {
                    withAnimation {
                        if selectedIndex < menuItems.count - 1 {
                            selectedIndex += 1
                        }
                    }
                }) {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 24))
                        .foregroundColor(Color.charcoalGrey)
                }
            }
            .padding()
        }
    }
}
