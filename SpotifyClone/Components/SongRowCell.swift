//
//  SongRowCell.swift
//  SpotifyClone
//
//  Created by christian on 4/3/24.
//

import SwiftUI

struct SongRowCell: View {
    let imageSize: CGFloat = 100
    let imageURL: String = Constants.randomImage
    let title: String = "Song name"
    let subtitle: String? = "Artist name"
    
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    
    var body: some View {
        HStack(spacing: 8) {
            ImageLoaderView(url: imageURL)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
            }
            
            Image(systemName: "ellipsis")
                .foregroundStyle(.spotifyWhite)
        }
        .frame(maxWidth: .infinity)
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            
            
        }
    }
}
