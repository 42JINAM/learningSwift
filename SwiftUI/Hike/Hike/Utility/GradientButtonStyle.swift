//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Private on 07/05/2025.
//
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // conditional statement with nil coalescing
                // condition ? A : B
                configuration.isPressed ?
                LinearGradient(colors: [
                    .colorGrayMedium,
                    .colorGrayLight,
                ], startPoint: .top, endPoint: .bottom)
                :
                LinearGradient(colors: [
                    .colorGrayLight,
                    .colorGrayMedium
                ], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
