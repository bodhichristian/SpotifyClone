//
//  ArtistMixOverlay.swift
//  SpotifyClone
//
//  Created by christian on 4/4/24.
//

import SwiftUI

struct ArtistMixOverlay: View {
    var artistName: String = "Artist Name"
    let colors: [Color] = [
        .playlistPink,
        .playlistMauve,
        .playlistYellow

    ]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: [
                    .spotifyBlack.opacity(0.01),
                    .spotifyBlack.opacity(0.5)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            VStack(alignment: .leading) {
                Image(systemName: "wave.3.forward.circle.fill")
                    .font(.footnote)
                    .foregroundStyle(.spotifyWhite)
                    .shadow(radius: 2)
                    .padding(6)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                VStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: 6, height: 20)
                    
                    Rectangle()
                        .frame(height: 6)
                }
                .foregroundStyle(colors.randomElement()!)

            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text(artistName)
                    .lineLimit(2)
                Text("Mix")
            }
            .font(.headline)
            .fontWeight(.bold)
            .foregroundStyle(.spotifyWhite)
            .padding(.leading, 16)
            .padding(.bottom, 12)
        }
    }
}

#Preview {
    Rectangle()
        .frame(width: 160, height: 160).overlay {
            ImageLoaderView(url: Constants.randomImage)
            ArtistMixOverlay(artistName: "Green Day")
            
        }
}
