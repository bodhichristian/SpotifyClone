//
//  DailyMixTopShape.swift
//  SpotifyClone
//
//  Created by christian on 4/5/24.
//

import SwiftUI

struct LavaLampA: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // MARK: top lava

            path.move(to: CGPoint(x: rect.minX, y: rect.height * 0.2))
            
            path.addQuadCurve( // from leading edge
                to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.1),
                control: CGPoint(x: rect.width * 0.1, y: rect.height * 0.25))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width * 0.55, y: rect.height * 0.1),
                control: CGPoint(x: rect.width * 0.4, y: rect.height * 0.02))
            
            path.addQuadCurve( // to top edge
                to: CGPoint(x: rect.width * 0.70, y: rect.minY),
                control: CGPoint(x: rect.width * 0.70, y: rect.height * 0.20))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // MARK: bottom lava
            path.move(to: CGPoint(x: rect.minX, y: rect.height * 0.7))
            
            path.addQuadCurve( // from leading edge
                to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.7),
                control: CGPoint(x: rect.width * 0.2, y: rect.height * 0.55))
            
            path.addQuadCurve( // to trailing edge
                to: CGPoint(x: rect.maxX, y: rect.height * 0.8),
                control: CGPoint(x: rect.width * 0.9, y: rect.height * 0.9))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

#Preview {
    LavaLampA()
        .border(.black)
        .frame(width: 160, height: 160)
        
}








