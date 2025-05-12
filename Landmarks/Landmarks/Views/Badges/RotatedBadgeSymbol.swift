//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Private on 12/05/2025.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
        
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
