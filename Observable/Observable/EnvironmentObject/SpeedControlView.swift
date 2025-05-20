//
//  SpeedControlView.swift
//  Observable
//
//  Created by Private on 20/05/2025.
//

import SwiftUI

struct SpeedControlView: View {
    @EnvironmentObject var speedSetting: SpeedSetting
    
    var body: some View {
        Slider(value: $speedSetting.speed, in: 0...100)
    }
}

