//
//  TutorialView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/22/24.
//

import SwiftUI

struct TutorialView: View {
    
    // Allows me to dismiss the current screen simulating the effects of the back button
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // TODO: SNOW TUTORIAL - SUMMER TUTORIAL
                    // Could be funny to have a tutorial where I'm trying to play in a snow-storm
                    // Put snow tutorial at the bottom of the tutorial page and have it be an easter egg?
                        // Maybe a stripe saying "X. [something about snow]" is a button that you can click but I don't tell you that it's clickable.
                    
                    TitlePage(title: "Tutorial Page")
                        .padding(.bottom, 20)
                    
                    FullWidthTextStripe(text: "Setup")

                    FullWidthTextStripe(text: "X. If you are a kicker:")
                    JustifiedText(text: "Setup balls on the midfield for restarts and both try-zones on different widths. Alternatively it can be beneficial to visualize successful kicks rather than physically taking them.")
                    
                    FullWidthTextStripe(text: "X. Select your intensity:")
                    JustifiedText(text: "Note: Your Intensity selection dictates how many events occur during your session. A higher intensity correlates to less scrums and more linebreaks.")
                    
                    FullWidthTextStripe(text: "Press play!")
                    JustifiedText(text: "Put your phone into your runners arm sleeve")
                    JustifiedText(text: "Note: Pockets work fine but it's more enjoyable to have an arm sleeve IMO.")
                    
                    FullWidthTextStripe(text: "X. If you hear linebreak:")
                    JustifiedText(text: "Hustle back if on defense or upfield in support if you're on offense. Visualize hitting a gap or chasing down a shifty attacker.")
                    
                    FullWidthTextStripe(text: "X. If you hear tackle & poach:")
                    JustifiedText(text: "Do an up-down wherever you are, or go through your tackle motion and then quickly circle onsides for the poach.")
                    JustifiedText(text: "Note: While something like this is good exercise anyways, make sure to visualize executing the actual skill or you are cheating yourself of the mental reps.")
                    
                    FullWidthTextStripe(text: "X. If you hear try and you are a kicker:")
                    JustifiedText(text: "Have balls setup at the middle for the restart and maybe a few setup (or you can run and grab them) to take the kick on posts.")
                    JustifiedText(text: "Note: It's important to practice these skills while tired to work on mental strength, but I encourage doing a kicking session when you aren't tired as well to better focus on your technique and not simply your ability to lock in while tired.")
                    
                    Spacer() // Add extra space to avoid button overlapping content
                        .frame(height: 80)
                    
                }
                .padding(.top, 20)
            }
            
            BackButton(text: "Return to Intensity Selection")

        }
        .navigationTitle("")
    }
}

// TODO: [Idea] chef up some graphics/photos for how to play the game. This can be done at the end of development

#Preview {
    TutorialView()
}
