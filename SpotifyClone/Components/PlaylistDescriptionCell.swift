//
//  PlaylistDescriptionCell.swift
//  SpotifyClone
//
//  Created by christian on 3/31/24.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    var descriptionText: String = Product.mock.description
    var userName: String = "Christian"
    var subheadline: String = "Some headline goes here"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)

            madeForYouSection
            
            Text(subheadline)
            
            buttonsRow
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
    private var madeForYouSection: some View {
        
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            
            Text("Made for ") +
            Text(userName)
                .fontWeight(.bold)
                .foregroundStyle(.spotifyWhite)
        }
    }
    
    private var buttonsRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0.0001))
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
                
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0.0001))
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
                
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0.0001))
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
                
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0.0001))
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8) {
                Image(systemName: "shuffle")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0.0001))
                    .font(.system(size: 24))
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
                
                Image(systemName: "play.circle.fill")
                    .padding(8)
                    .font(.system(size: 46))
                    .background(Color.spotifyBlack.opacity(0.0001))
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
            }
            .foregroundStyle(.spotifyGreen)
        }
        .font(.title2)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        PlaylistDescriptionCell()
    }
}
