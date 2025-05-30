//
//  TwoColumnView.swift
//  NaviSplitView
//
//  Created by Private on 30/05/2025.
//

import SwiftUI

struct TwoColumnView: View {
    @State private var colors = ["Red", "Green", "Blue"]
    @State private var selectedColor: String?
    @State private var columnVisibility = NavigationSplitViewVisibility.detailOnly
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(colors, id: \.self, selection: $selectedColor) { color in
                Text(color).tag(color)
            }
        } detail: {
            Text(selectedColor ?? "No color selected")
        }
        .navigationSplitViewStyle(.automatic)
    }
}

#Preview {
    TwoColumnView()
}
