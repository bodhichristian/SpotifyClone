//
//  SpotifyCloneApp.swift
//  SpotifyClone
//
//  Created by christian on 3/27/24.
//

import SwiftUI
import SwiftfulRouting

@main
struct SpotifyCloneApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}
