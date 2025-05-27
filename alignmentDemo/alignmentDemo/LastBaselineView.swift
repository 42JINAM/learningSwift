//
//  LastBaselineView.swift
//  alignmentDemo
//
//  Created by Private on 26/05/2025.
//

import SwiftUI

struct LastBaselineView: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("This is some text")
                .font(.largeTitle)
            Text("This is some much longer text")
                .font(.body)
            Text("This is short")
                .font(.headline)
        }
    }
}

#Preview {
    LastBaselineView()
}
