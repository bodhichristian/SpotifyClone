//
//  LavaLampB.swift
//  SpotifyClone
//
//  Created by christian on 4/6/24.
//

import SwiftUI

struct LavaLampB: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // MARK: top lava
            path.move(to: CGPoint(x: rect.minX, y: rect.height * 0.2))
            
            path.addQuadCurve( // from leading edge
                to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.1),
                control: CGPoint(x: rect.width * 0.1, y: rect.height * 0.25))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.height * 0.55, y: rect.height * 0.1),
                control: CGPoint(x: rect.width * 0.45, y: rect.height * 0.02))
            
            path.addQuadCurve( // to top edge
                to: CGPoint(x: rect.width * 0.90, y: rect.minY),
                control: CGPoint(x: rect.width * 0.70, y: rect.height * 0.2))
            
            // top edge
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // MARK: bottom lava
            path.move(to: CGPoint(x: rect.minX, y: rect.height * 0.6))
            
            path.addQuadCurve( // from leading edge
                to: CGPoint(x: rect.width * 0.35, y: rect.height * 0.7),
                control: CGPoint(x: rect.width * 0.15, y: rect.height * 0.55))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width * 0.7, y: rect.height * 0.7),
                control: CGPoint(x: rect.midX, y: rect.height * 0.8))
            
            
            path.addQuadCurve( // to trailing edge
                to: CGPoint(x: rect.maxX, y: rect.height * 0.7),
                control: CGPoint(x: rect.width * 0.9, y: rect.height * 0.55))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

#Preview {
    LavaLampB()
        .border(.black)
        .frame(width: 160, height: 160)
}

