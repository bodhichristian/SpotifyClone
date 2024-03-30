//
//  SpotifyRecentsCell.swift
//  SpotifyClone
//
//  Created by christian on 3/29/24.
//
import SwiftUI

struct SpotifyRecentsCell: View {
    var imageURL: String = Constants.randomImage
    var title = "This is an example title"
    
    var body: some View {
        HStack {
            ImageLoaderView(url: imageURL)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing)
        .background(Color.spotifyGray)
        .foregroundStyle(.spotifyWhite)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        VStack {
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
}
