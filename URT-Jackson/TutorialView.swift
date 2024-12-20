//
//  TutorialView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/22/24.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    TitlePage(title: "Tutorial Page")
                        .padding(.bottom, 20)
                    
                    FullWidthTextStripe(text: "1. Select your intensity")
                    JustifiedText(text: "Note: Your Intensity selection dictates how many events occur during your session. A higher intensity correlates to less scrums and more linebreaks.")
                    
                    FullWidthTextStripe(text: "2. Press play!")
                    
                    FullWidthTextStripe(text: "3. If you hear linebreak:")
                    JustifiedText(text: "Hustle back if on defense or upfield in support if you're on offense. Visualize hitting a gap or chasing down a shifty attacker.")
                    
                    FullWidthTextStripe(text: "4. If you hear tackle & poach:")
                    JustifiedText(text: "Do an up-down wherever you are, or go through your tackle motion and then quickly circle onsides for the poach.")
                    JustifiedText(text: "Note: While something like this is good exercise anyways, make sure to visualize executing the actual skill or you are cheating yourself of the mental reps.")
                    
                    FullWidthTextStripe(text: "5. If you hear try and you are a kicker:")
                    JustifiedText(text: "Have balls setup at the middle for the restart and maybe a few setup (or you can run and grab them) to take the kick on posts.")
                    JustifiedText(text: "Note: It's important to practice these skills while tired to work on mental strength, but I encourage doing a kicking session when you aren't tired as well to better focus on your technique and not simply your ability to lock in while tired.")
                    
                    Spacer() // Add extra space to avoid button overlapping content
                        .frame(height: 80)
                    
                }
                .padding(.top, 20)
            }
            
            CustomNavButton(
                text: "Return to Intensity Selection",
                destination: GameSimulationView()
            )
        }
        .navigationTitle("")
    }
}

// TODO: chef up some graphics/photos for how to play the game. This can be done at the end of development

#Preview {
    TutorialView()
}
