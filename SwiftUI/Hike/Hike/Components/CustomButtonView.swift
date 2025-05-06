//
//  CustomButtonView.swift
//  Hike
//
//  Created by Private on 06/05/2025.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.colorGreenLight, .colorGreenMedium]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    
                )
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [.colorGrayLight, .colorGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 4
                )
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.colorGrayLight, .colorGreenDark],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits)
        .padding()
}
