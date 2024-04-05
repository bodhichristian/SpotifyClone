//
//  TitleRowCell.swift
//  SpotifyClone
//
//  Created by christian on 3/30/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistGridItem: View {
    
    var imageSize: CGFloat = 100
    var imageURL: String
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(url: imageURL)
                .frame(width: imageSize, height: imageSize)
            Text(title)
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
            PlaylistGridItem(imageURL: Constants.randomImage, title: "Product")
            PlaylistGridItem(imageURL: Constants.randomImage, title: "Product")
            PlaylistGridItem(imageURL: Constants.randomImage, title: "Product")
        }
    }
}
