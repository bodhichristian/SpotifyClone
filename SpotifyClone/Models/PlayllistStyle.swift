//
//  PlayllistStyle.swift
//  SpotifyClone
//
//  Created by christian on 4/5/24.
//

import Foundation
import SwiftUI

enum PlaylistStyle: CaseIterable {
    case yourTopMixes,
         madeForUser,
         recentlyPlayed,
         popularRadio,
         recommendedRadio,
         basedOnYourRecentListening
    
    var title: String {
        switch self {
        case .yourTopMixes:
            "Your top mixes"
        case .madeForUser:
            "Made for "
        case .recentlyPlayed:
            "Recently played"
        case .popularRadio:
            "Popular radio"
        case .recommendedRadio:
            "Recommended radio"
        case .basedOnYourRecentListening:
            "Based on your recent listening"
        }
    }
}

