//
//  SpotifyNewReleaseCell.swift
//  SpotifyClone
//
//  Created by christian on 3/30/24.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageURL: String = Constants.randomImage
    var headline: String? = "New release from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - Title"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                ImageLoaderView(url: imageURL)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView(url: imageURL)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32){
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyLightGray)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyWhite)
                        }
                    }
                    .font(.callout)
                    
                    HStack {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title3)
                            .padding(4)
                            .background(Color.black.opacity(0.0001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title3)

                    }
                }
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()
    }
}
