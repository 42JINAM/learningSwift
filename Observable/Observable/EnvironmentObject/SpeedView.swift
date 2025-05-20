//
//  SpeedView.swift
//  Observable
//
//  Created by Private on 20/05/2025.
//

import SwiftUI

struct SpeedView: View {
    let speedsetting = SpeedSetting()
    
    var body: some View {
        VStack {
            SpeedControlView()
            SpeedDisplayView()
        }
        .environmentObject(speedsetting)
    }
}

#Preview {
    SpeedView()
}
