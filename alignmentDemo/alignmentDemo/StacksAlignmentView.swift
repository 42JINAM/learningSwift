//
//  StacksAlignmentView.swift
//  alignmentDemo
//
//  Created by Private on 26/05/2025.
//

import SwiftUI

struct StacksAlignmentView: View {
    var body: some View {
        HStack(alignment: .crossAlignment, spacing: 20) {
            Circle()
                .foregroundColor(.purple)
                .alignmentGuide(
                    .crossAlignment,
                    computeValue: { d in d[VerticalAlignment.center]
                    })
                .frame(width: 100, height: 100)
            VStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .alignmentGuide(
                        .crossAlignment,
                        computeValue: {d in d[VerticalAlignment.center]
                        })
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
            }
        }
    }
}

extension VerticalAlignment {
    private enum CrossAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}

#Preview {
    StacksAlignmentView()
}
