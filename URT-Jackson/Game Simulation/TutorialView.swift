//
//  TutorialView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/22/24.
//

import SwiftUI

// TODO: [Feature] Make this a tutorial view menu, where you can select text or video. Make a no-connection error pop up for clicking the video without wifi. Maybe the photo for the page could be a graduation cap?

struct TutorialView: View {
    @Binding var path: NavigationPath
    
    // Allows me to dismiss the current screen simulating the effects of the back button
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.lightGrey // Background color
                .edgesIgnoringSafeArea(.all) // Fill entire background

            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // TODO: [Funny Feature] SNOW TUTORIAL - SUMMER TUTORIAL
                    // Could be funny to have a tutorial where I'm trying to play in a snow-storm
                    // Put snow tutorial at the bottom of the tutorial page and have it be an easter egg?
                        // Maybe a stripe saying "X. [something about snow]" is a button that you can click but I don't tell you that it's clickable.
                    
                    FullWidthTextStripe(text: "Select your intensity")
                    JustifiedText(text: "Your Intensity selection dictates how many events occur during your session. A higher intensity correlates to less scrums and more linebreaks (longer passages of play = 🥵🥵)")
                    
                    FullWidthTextStripe(text: "Press play!")
                    JustifiedText(text: "Put your phone into your runners arm sleeve.")
                    JustifiedText(text: "Pockets work fine but it's more enjoyable to have an arm sleeve IMO.")
                    
                    FullWidthTextStripe(text: "If you hear LINEBREAK...")
                    JustifiedText(text: "... hustle back if on defense or upfield in support if you're on offense. Visualize hitting a gap or chasing down a shifty attacker.")
                    
                    FullWidthTextStripe(text: "If you hear TACKLE & POACH...")
                    JustifiedText(text: "... do an up-down wherever you are, or go through your tackle motion and then quickly circle onsides for the poach.")
                    JustifiedText(text: "While this is good exercise, make sure to visualize executing the actual skill or you are cheating yourself of the mental reps.")
                    
                    FullWidthTextStripe(text: "If you hear TRY and you are a kicker...")
                    JustifiedText(text: "... have balls setup at the middle for the restart and maybe a few setup (or you can run and grab them) to take the kick on posts.")
                    JustifiedText(text: "It can also be beneficial for you to practice visualization with your kicking too, and imagine making strong a strong and successful kick 🦵🎉")

                    FullWidthTextStripe(text: "IMPORTANT NOTE: This app is simply providing a framework.")
                    JustifiedText(text: "Go through the mental exercise of visualizing yourself successfully playing a rugby game. That is the point--not simply to make you look stupid running around a field alone 😂")
                    
                    FullWidthTextStripe(text: "If you see an ERROR with the APP...")
                    JustifiedText(text: "... make sure to send hate mail to the developer devjevvy@gmail.com ⬅️🤬")
                    JustifiedText(text: "Alternatively, email a suggested fix or new feature to devjevvy@gmail.com 😇")

                    Spacer() // Add extra space to avoid button overlapping content
                        .frame(height: 80)
                    
                }
                .padding(.top, 20)
            }
            
            BackButton(text: "Return to Intensity Selection", path: $path)
                .padding(.bottom)

        }
        .navigationTitle("")
    }
}

// TODO: [Idea] chef up some graphics/photos for how to play the game. This can be done at the end of development

#Preview {
    TutorialView(path: .constant(NavigationPath()))
}
