//
//  Jersey_TrackerApp.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/4/21.
//

import SwiftUI

@main
struct Jersey_TrackerApp: App {
    
    @State  var passIn = true
    @State  var passInString = ""
    var body: some Scene {
        WindowGroup {
            ContentView(homeJersey: $passIn, awayJersey: $passIn, notes: $passInString)
        }
    }
}
