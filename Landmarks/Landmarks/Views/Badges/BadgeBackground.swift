//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Private on 12/05/2025.
//


import SwiftUI


struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(
                    geometry.size.width,
                    geometry.size.height
                )
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width - height * xScale) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve(
                        to: CGPoint (
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint (
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
                
            }
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart: Color = Color(red: 239 / 255, green: 120 / 255, blue: 221 / 255)
    static let gradientEnd: Color = Color(red: 239 / 255, green: 172 / 255, blue: 120 / 255)
}


#Preview {
    BadgeBackground()
}

