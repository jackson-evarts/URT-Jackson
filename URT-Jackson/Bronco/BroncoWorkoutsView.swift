//
//  BroncoWorkoutsView.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/4/25.
//

import SwiftUI

struct BroncoWorkoutsView: View {
    
    let menuItems: [String] = [
        "1-1-1-1-1-1-1-1-1-1 (10 legs)",
        "1-1-1-1-1-1 (6 legs)",
        "2-2-1-1",
        "3-2"
    ] // List of menu items
    
    @State private var selectedIndex: Int = 0 // Track the selected index
    
    var body: some View {
        NavigationStack {
            VStack {
                TitlePage(title: "Bronco Workout Selection")
                    .padding()
                
                // Swipeable Menu
                ZStack(alignment: .leading) {
                    
                    // Static Menu Items (Visible list)
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(menuItems.indices, id: \.self) { index in
                            Text(menuItems[index])
                                .font(.custom("Futura", size: 20))
                                .foregroundColor(index == selectedIndex ? .primaryGold : .charcoalGrey)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 30)
                        }
                    }
                    
                    // Moving Arrow Indicator
                    VStack {
                        ForEach(menuItems.indices, id: \.self) { index in
                            if index == selectedIndex {
                                HStack {
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
                .frame(maxWidth: .infinity, maxHeight: 300)
                .padding()
                .background(Color.lightGrey.opacity(0.2))
                .cornerRadius(10)
                .gesture(
                    DragGesture()
                        .onEnded { gesture in
                            let verticalMovement = gesture.translation.height
                            
                            withAnimation {
                                if verticalMovement > 30 && selectedIndex < menuItems.count - 1 {
                                    // Swipe Down → Move Down
                                    selectedIndex += 1
                                } else if verticalMovement < -30 && selectedIndex > 0 {
                                    // Swipe Up → Move Up
                                    selectedIndex -= 1
                                }
                            }
                        }
                )
                
                // Text Instructions
                Text("Swipe up/down or use the arrows to change workouts.")
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.darkGrey)
                    .padding()
                
                // Arrow Buttons for Navigation
                HStack(spacing: 60) {
                    Button(action: {
                        withAnimation {
                            if selectedIndex > 0 {
                                selectedIndex -= 1
                            }
                        }
                    }) {
                        Image(systemName: "chevron.up")
                            .font(.system(size: 30))
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
                            .font(.system(size: 30))
                            .foregroundColor(Color.charcoalGrey)
                    }
                }
                .padding()
                
                // Play Button
                CustomNavButton(
                    text: "Play",
                    destination: BroncoWorkoutPlayView(selectedWorkout: menuItems[selectedIndex])
                )
                .padding(.vertical)
                
                // Back Button
                BackButton(text: "Return to Bronco Menu")
            }
        } // End NavigationStack
    } // End View
} // End BroncoWorkoutsView

#Preview {
    BroncoWorkoutsView()
}
