//
//  AlignmentGuideView.swift
//  alignmentDemo
//
//  Created by Private on 26/05/2025.
//

import SwiftUI

struct AlignmentGuideView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 120, height: 50)
            Rectangle()
                .foregroundColor(.red)
                .alignmentGuide(
                    .leading,
                    computeValue: {d in d[HorizontalAlignment.trailing] + 20
                    })
                .frame(width: 200, height: 50)
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 180, height: 50)
        }
    }
}

#Preview {
    AlignmentGuideView()
}
