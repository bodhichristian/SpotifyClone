//
//  SongRowCell.swift
//  SpotifyClone
//
//  Created by christian on 4/3/24.
//

import SwiftUI

struct SongRowCell: View {
    var imageSize: CGFloat = 50
    var imageURL: String = Constants.randomImage
    var title: String = "Song name"
    var subtitle: String? = "Artist name"
    
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
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)

            Image(systemName: "ellipsis")
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(Color.spotifyBlack.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .background(Color.spotifyBlack.opacity(0.001))
        .onTapGesture {
            onCellPressed?()
        }
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
