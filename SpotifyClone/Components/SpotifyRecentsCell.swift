//
//  SpotifyRecentsCell.swift
//  SpotifyClone
//
//  Created by christian on 3/28/24.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    var imageURL: String = Constants.randomImage
    var title = "This is an example title"
    
    var body: some View {
        HStack {
            ImageLoaderView(url: imageURL)
                .frame(width: 55, height: 50)
            
            Text(title)
                .font(.caption2)
                .fontWeight(.semibold)
                .lineLimit(2)
            
        }
        .padding(.trailing)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
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
