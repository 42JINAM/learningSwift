//
//  CustomAlignmentView.swift
//  alignmentDemo
//
//  Created by Private on 26/05/2025.
//

import SwiftUI

struct CustomAlignmentView: View {
    var body: some View {
        HStack(alignment: .oneThird) {
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(.red)
                .alignmentGuide(
                    .oneThird,
                    computeValue: {d in d[VerticalAlignment.top]})
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(.orange)
                .alignmentGuide(
                    .oneThird,
                    computeValue: {d in d[VerticalAlignment.bottom]})
                .frame(width: 50, height: 200)
        }
    }
}

extension VerticalAlignment {
    private enum OneThird: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}

#Preview {
    CustomAlignmentView()
}
