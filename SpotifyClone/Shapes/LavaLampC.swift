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
                to: CGPoint(x: rect.width * 0.25, y: rect.height * 0.15),
                control: CGPoint(x: rect.width * 0.1, y: rect.height * 0.3))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width * 0.7, y: rect.height * 0.1),
                control: CGPoint(x: rect.width * 0.45, y: rect.minY ))
            
            path.addQuadCurve( // to trailing edge
                to: CGPoint(x: rect.maxX, y: rect.height * 0.05),
                control: CGPoint(x: rect.width * 0.9, y: rect.height * 0.2))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            // top edge
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // MARK: bottom lava
            path.move(to: CGPoint(x: rect.minX, y: rect.height * 0.8))
            
            path.addQuadCurve( // from leading edge
                to: CGPoint(x: rect.width * 0.85, y: rect.height * 0.9),
                control: CGPoint(x: rect.width * 0.2, y: rect.height * 0.5))
            
            path.addQuadCurve( // to trailing edge
                to: CGPoint(x: rect.maxX, y: rect.height * 0.9),
                control: CGPoint(x: rect.width * 0.95, y: rect.height * 0.95))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}
#Preview {
    VStack {
//        LavaLampA()
//            .foregroundStyle(.palePink)
//            .frame(width: 160, height: 160)
//        LavaLampB()
//            .foregroundStyle(.paleGreen)
//            .frame(width: 160, height: 160)
        LavaLampC()
            .foregroundStyle(.paleOrange)
            .frame(width: 160, height: 160)
    }
}
