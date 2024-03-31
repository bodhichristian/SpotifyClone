//
//  SpotifyPlaylistView.swift
//  SpotifyClone
//
//  Created by christian on 3/31/24.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    
    var product: Product = .mock
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand,
                        imageURL: product.thumbnail
                    )
                }
            }
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
