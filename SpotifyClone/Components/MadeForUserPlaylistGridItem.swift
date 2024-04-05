//
//  MadeForUserPlaylistGridItem.swift
//  SpotifyClone
//
//  Created by christian on 4/5/24.
//
import SwiftUI

struct MadeForUserPlaylistGridItem: View {
    var imageURL: String
    var title: String
    let colors: [Color] = [
        .paleRed,
        .palePink,
        .paleGreen,
        .paleOrange

    ]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ImageLoaderView(url: imageURL)
            
            
            VStack(alignment: .leading) {
                Image(systemName: "wave.3.forward.circle.fill")
                    .font(.footnote)
                    .foregroundStyle(.spotifyBlack)
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
            
            HStack (alignment: .bottom,  spacing: 0) {
                
                Text(title)
                Text(" Mix")
            }
            .lineLimit(2)

            .font(.headline)
            .fontWeight(.bold)
            .foregroundStyle(.spotifyWhite)
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
            MadeForUserPlaylistGridItem(imageURL: Constants.randomImage, title: "A Day to Remember")
            
        }
}
