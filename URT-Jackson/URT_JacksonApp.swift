//
//  URT_JacksonApp.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 12/20/24.
//

import SwiftUI

@main
struct URT_JacksonApp: App {
    init() {
        #if DEBUG
        // Reset the "first-time" flag for testing purposes
        UserDefaults.standard.set(false, forKey: "hasSeenGameSimulationTip")
        #endif
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
