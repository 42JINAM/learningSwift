//
//  WifiImageView.swift
//  Observable
//
//  Created by Private on 20/05/2025.
//

import SwiftUI

struct WifiImageView: View {
    @Binding var wifiEnabled: Bool
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}
