//
//  SwiftUIView.swift
//  Observable
//
//  Created by Private on 20/05/2025.
//

import SwiftUI

struct SpeedDisplayView: View {
    @EnvironmentObject var speedsetting: SpeedSetting
    var body: some View {
        Text("Speed = \(speedsetting.speed) km/h")
    }
}

