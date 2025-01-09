//
//  BroncoWorkoutsView.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/4/25.
//

import SwiftUI

struct BroncoWorkoutsView: View {
    
    let menuItems: [String] = [
        "3-2",
        "2-2-1-1",
        "1-1-1-1-1",
        "1-1-1-1-1-1-1-1-1-1",
    ]
    
    let menuDescriptions: [String] = [
        "Run three bronco legs, take around a minute break, then run another two bronco legs.\nSuggestion: This one is beneficial for practicing running at your desired bronco pace.\n🙂🙂🙂🙂🙂",
        "With around a one minute break in between sets, do a set of: two bronco legs, two bronco legs, one bronco leg, one bronco leg.\nSuggestion: Try to run the first four bronco legs at your desired bronco pace, and then burnout on the last last two legs at full effort.\n🙂🙂🙂🙂💀💀",
        "Run five bronco legs at maximum speed every two minutes for a total of five legs.\nSuggestion: Gun it on these. You get a one minute break so you should be running full tilt every leg.\n💀💀💀💀💀",
        "Run one bronco leg at maximum (possible) speed every two minutes for a total of ten legs. Test your mental. Why are you doing this to yourself?\nSuggestion: Dig deep dawg. Godspeed.\n💀💀💀💀💀💀💀🤢🤢🤢",
    ]
    
    @State private var selectedIndex: Int = 0
    @EnvironmentObject var audioTimerManager: GlobalAudioTimerManager
    
    var body: some View {
        NavigationStack {
            
            ZStack{
                
                Color.lightGrey // Background color
                    .edgesIgnoringSafeArea(.all) // Fill entire background

                
                // VStack in order to allow the full usage of the app on a screen as small as the iPhone SE
                VStack(spacing: 0) {
                    
                    // MARK: - Scrollable Content
                    ScrollView() {
                        VStack {
                            FullWidthTextStripe(text: "Workout Description")
                            
                            Text(menuDescriptions[selectedIndex])
                                .font(.custom("Futura", size: 16))
                                .foregroundColor(.darkGrey)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.lightGrey.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.bottom, 10)
                            
                            FullWidthTextStripe(text: "Workout Selection")
                            
                            // Swipeable Menu
                            ZStack(alignment: .leading) {
                                VStack(alignment: .leading, spacing: 20) {
                                    ForEach(menuItems.indices, id: \.self) { index in
                                        Text(menuItems[index])
                                            .font(.custom("Futura", size: 20))
                                            .foregroundColor(index == selectedIndex ? .primaryGold : .charcoalGrey)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.leading, 30)
                                    }
                                }
                                
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
                                            Spacer().frame(height: 45)
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
                                                selectedIndex += 1
                                            } else if verticalMovement < -30 && selectedIndex > 0 {
                                                selectedIndex -= 1
                                            }
                                        }
                                    }
                            )
                        }
                        
                        /*
                        FullWidthTextStripe(text: "Setup")
                        
                        JustifiedText(text: "Prop your phone on a shoe on the baseline and press play.")
                            .padding(.bottom)
                         */
                    }
                    
                    
                    
                    // MARK: - Bottom Fixed Elements
                    VStack {
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
                        .padding(.vertical, 10)
                        
                        CustomNavButton(
                            text: "Play",
                            destination: BroncoWorkoutPlayView(selectedWorkout: menuItems[selectedIndex])
                        )
                        .padding(.vertical, 5)
                        
                        BackButton(text: "Return to Bronco Menu")
                            .padding(.bottom, 10)
                    }
                }
                .ignoresSafeArea(.keyboard) // Handle keyboard appearance properly
            }
        }
    }
}

#Preview {
    BroncoWorkoutsView()
        .environmentObject(GlobalAudioTimerManager())
}
