//
//  URT_JacksonApp.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 12/20/24.
//

import SwiftUI

@main
struct URT_JacksonApp: App {
    
    @StateObject private var audioTimerManager = GlobalAudioTimerManager()

    
    init() {
        #if DEBUG
        // Reset the "first-time" flag for testing purposes
        UserDefaults.standard.set(false, forKey: "hasSeenGameSimulationTip")
        #endif
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioTimerManager) // Inject the global manager
            // .environmentObject(...) makes the manager available to all views in the SwiftUI hierarchy.


        }
    }
}
