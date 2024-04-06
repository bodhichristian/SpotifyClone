//
//  MadeForUserPlaylistGridItem.swift
//  SpotifyClone
//
//  Created by christian on 4/5/24.
//
import SwiftUI

struct DailyMixPlaylistCoverView: View {
    var imageURL: String
    let colors: [Color] = [
        .paleRed,
        .palePink,
        .paleGreen,
        .paleOrange
        
    ]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ImageLoaderView(url: imageURL)
            
            LavaLamp()
                .foregroundStyle(colors.randomElement()!)
                .opacity(0.9)
            VStack(alignment: .leading) {
                Image(systemName: "wave.3.forward.circle.fill")
                    .font(.footnote)
                    .foregroundStyle(.spotifyBlack)
                    .padding(6)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            Text("Daily Mix")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.spotifyBlack)
                .padding(.leading, 16)
                .padding(.bottom, 12)
        }
        .frame(width: 160, height: 160)
        
    }
}

#Preview {
    Rectangle()
        .frame(width: 160, height: 160).overlay {
            ImageLoaderView(url: Constants.randomImage)
            DailyMixPlaylistCoverView(imageURL: Constants.randomImage)
            
        }
}
