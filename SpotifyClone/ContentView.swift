//
//  ContentView.swift
//  SpotifyClone
//
//  Created by christian on 3/27/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    @Environment(\.router) var router
    
    var body: some View {
        LavaLampB()
            .frame(width: 160, height: 160)
//        List {
//            Button("Open Spotify") {
//                router.showScreen(.fullScreenCover) { _ in
//                    SpotifyHomeView()
//                }
//            }
//        }
    }

}

#Preview {
    RouterView { router in
        ContentView()
    }
}
