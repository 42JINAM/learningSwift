//
//  VStack.swift
//  Observable
//
//  Created by Private on 20/05/2025.
//
import SwiftUI

struct StateView: View {
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnabled) {
                Text("Enable Wi-Fi")
            }
            TextField("Enter user name", text: $userName)
            Text(userName)
            WifiImageView(wifiEnabled: $wifiEnabled)
        }
    }
}

#Preview {
    StateView()
}
