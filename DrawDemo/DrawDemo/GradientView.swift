//
//  GradientView.swift
//  DrawDemo
//
//  Created by Private on 04/06/2025.
//

import SwiftUI

struct GradientView: View {
    let colors = Gradient(colors: [Color.red, .yellow, .green, .blue, .purple])
    var body: some View {
        Circle()
            .fill(
                RadialGradient(
                    gradient: colors,
                    center: .center,
                    startRadius: CGFloat(0),
                    endRadius: CGFloat(300)
                )
            )
        Circle()
            .fill(AngularGradient(gradient: colors, center: .center))
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: colors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        MyShape()
            .fill(
                RadialGradient(
                    gradient: colors,
                    center: .center,
                    startRadius: CGFloat(0),
                    endRadius: CGFloat(300)
                )
            )
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.black, .white]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 360, height: 350)
            
        
        
    }
}

#Preview {
    GradientView()
}
