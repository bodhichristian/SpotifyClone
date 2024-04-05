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
                    case .yourTopMixes:
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
            PlaylistGridItem(imageURL: Constants.randomImage, title: "Product", style: .yourTopMixes)
            PlaylistGridItem(imageURL: Constants.randomImage, title: "Product", style: .yourTopMixes)
            PlaylistGridItem(imageURL: Constants.randomImage, title: "Product", style: .yourTopMixes)
        }
    }
}


enum PlaylistStyle: CaseIterable {
    case yourTopMixes,
         madeForUser,
         recentlyPlayed,
         popularRadio,
         recommendedRadio,
         basedOnYourRecentListening
    
    var title: String {
        switch self {
        case .yourTopMixes:
            "Your top mixes"
        case .madeForUser:
            "Made for "
        case .recentlyPlayed:
            "Recently played"
        case .popularRadio:
            "Popular radio"
        case .recommendedRadio:
            "Recommended radio"
        case .basedOnYourRecentListening:
            "Based on your recent listening"
        }
    }
}

