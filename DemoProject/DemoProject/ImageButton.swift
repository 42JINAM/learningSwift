//
//  ImageButton.swift
//  DemoProject
//
//  Created by Private on 19/05/2025.
//

import SwiftUI

struct ImageButton: View {
    var body: some View {
        Button(action: {
            print("Button Clicked")
        }) {
            Image(systemName: "square.and.arrow.up")
        }
    }
}

#Preview {
    ImageButton()
}
