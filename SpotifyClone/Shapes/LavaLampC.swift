//
//  LavaLampC.swift
//  SpotifyClone
//
//  Created by christian on 4/6/24.
//

import SwiftUI

struct LavaLampC: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // MARK: top lava
            path.move(
                to: CGPoint(x: rect.minX, y: rect.height * 0.15)
            )
            
            path.addQuadCurve( // from leading edge
                to: CGPoint(x: rect.width * 0.25, y: rect.height * 0.2),
                control: CGPoint(x: rect.width * 0.1, y: rect.height * 0.3))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width * 0.6, y: rect.height * 0.2),
                control: CGPoint(x: rect.width * 0.45, y: rect.height * 0.02))
            
            path.addQuadCurve( // to trailing edge
                to: CGPoint(x: rect.maxX, y: rect.height * 0.25),
                control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.35))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            // top edge
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // MARK: bottom lava
            path.move(to: CGPoint(x: rect.minX, y: rect.height * 0.8))
            
            path.addQuadCurve( // from leading edge
                to: CGPoint(x: rect.width * 0.4, y: rect.height * 0.8),
                control: CGPoint(x: rect.width * 0.15, y: rect.height * 0.65))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width * 0.75, y: rect.height * 0.75),
                control: CGPoint(x: rect.width * 0.6, y: rect.height * 0.90))
            
            
            path.addQuadCurve( // to trailing edge
                to: CGPoint(x: rect.maxX, y: rect.height * 0.65),
                control: CGPoint(x: rect.width * 0.95, y: rect.height * 0.55))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}
#Preview {
    LavaLampC()
        .frame(width: 160, height: 160)
}
