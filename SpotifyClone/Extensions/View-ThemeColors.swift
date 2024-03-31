//
//  View-ThemeColors.swift
//  SpotifyClone
//
//  Created by christian on 3/30/24.
//

import Foundation
import SwiftUI

extension View {
    
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
        
    }
}
