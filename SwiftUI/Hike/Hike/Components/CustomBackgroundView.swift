//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Private on 06/05/2025.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            //MARK: - 3. Depth
            
            Color.colorGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            //MARK: - 2. Light
            Color.colorGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            //MARK: - 1. Surface
            LinearGradient(
                colors: [
                    .colorGreenLight,
                    .colorGreenMedium
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
