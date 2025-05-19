//
//  HStackView.swift
//  DemoProject
//
//  Created by Private on 19/05/2025.
//

import SwiftUI

struct HStackView: View {
    var body: some View {
        HStack {
            Image(systemName: "goforward.10")
            Image(systemName: "goforward.15")
            Image(systemName: "goforward.30")
        }
    }
}

#Preview {
    HStackView()
}
