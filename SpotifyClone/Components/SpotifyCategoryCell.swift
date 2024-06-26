//
//  SpotifyCategoryCell.swift
//  SpotifyClone
//
//  Created by christian on 3/27/24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var title: String = "Music"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.caption2)
            .fontWeight(.medium)
            .frame(minWidth: 32)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        VStack(spacing: 40) {
            SpotifyCategoryCell(title: "Title 1", isSelected: true)
            SpotifyCategoryCell(title: "Title 2")
            SpotifyCategoryCell(title: "Title 3", isSelected: true)
            SpotifyCategoryCell(title: "Title 4")
        }
    }
}
