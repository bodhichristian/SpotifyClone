//
//  TitleRowCell.swift
//  SpotifyClone
//
//  Created by christian on 3/30/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistGridItem: View {
    
    var imageSize: CGFloat = 160
    
    var imageURL: String
    var title: String
    var style: PlaylistStyle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(url: imageURL)
                .frame(width: imageSize, height: imageSize)
                .overlay {
                    switch style {
                    case .artistMix:
                        ArtistMixOverlay()
                    default:
                        Text("")
                    }
                }
            Text(title)
                .font(.caption)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
            
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        HStack {
            PlaylistGridItem(imageURL: Constants.randomImage, title: "Product", style: .artistMix)
            PlaylistGridItem(imageURL: Constants.randomImage, title: "Product", style: .artistMix)
            PlaylistGridItem(imageURL: Constants.randomImage, title: "Product", style: .artistMix)
        }
    }
}


enum PlaylistStyle {
    case artistMix,
         madeForUser,
         recentlyPlayed,
         popularRadio,
         recommendedRadio,
         basedOnRecentListening
    
    var title: String {
        switch self {
        case .artistMix:
            "Artist Mix"
        case .madeForUser:
            "Made for "
        case .recentlyPlayed:
            "Recently Played"
        case .popularRadio:
            "Popular Radio"
        case .recommendedRadio:
            "RecommendedRadio"
        case .basedOnRecentListening:
            "Based on Recent Listening"
        }
    }
}

