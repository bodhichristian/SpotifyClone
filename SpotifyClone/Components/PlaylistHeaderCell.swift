//
//  PlaylistHeaderCell.swift
//  SpotifyClone
//
//  Created by christian on 3/31/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    var height: CGFloat = 300
    var title: String = "Some playlist title goes here"
    var subtitle: String = "Subtitle goes here"
    var imageURL: String = Constants.randomImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                ImageLoaderView(url: imageURL)
            )
            .overlay(
                VStack (alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                    
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                    .foregroundStyle(.spotifyWhite)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background {
                        LinearGradient(
                            colors: [
                                shadowColor.opacity(0) ,
                                shadowColor
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    }
                
                ,
                alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView{
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
