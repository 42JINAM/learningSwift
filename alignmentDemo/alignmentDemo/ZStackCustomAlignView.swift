//
//  ZStackCustomAlignView.swift
//  alignmentDemo
//
//  Created by Private on 26/05/2025.
//

import SwiftUI

struct ZStackCustomAlignView: View {
    var body: some View {
        ZStack(alignment: .myAlignment) {
            Rectangle()
                .foregroundColor(.green)
                .alignmentGuide(
                    HorizontalAlignment.myAlignment,
                    computeValue: { d in d[.leading]
                    }
                )
                .alignmentGuide(
                    VerticalAlignment.myAlignment,
                    computeValue: {
                        d in d[VerticalAlignment.bottom]
                    }
                )
                .frame(width: 100, height: 100)
            Rectangle()
                .foregroundColor(.red)
                .alignmentGuide(
                    VerticalAlignment.myAlignment,
                    computeValue: {
                        d in d[VerticalAlignment.center]
                    }
                )
                .alignmentGuide(
                    HorizontalAlignment.myAlignment,
                    computeValue: {
                        d in d[HorizontalAlignment.trailing]
                    }
                )
                .frame(width: 100, height: 100)
            Circle()
                .foregroundColor(.orange)
                .alignmentGuide(
                    HorizontalAlignment.myAlignment,
                    computeValue: {
                        d in d[.leading]
                    }
                )
                .alignmentGuide(
                    VerticalAlignment.myAlignment,
                    computeValue: {
                        d in d[.top]
                    }
                )
                .frame(width: 100, height: 100)
        }
    }
}

extension HorizontalAlignment {
    enum MyHorizontal: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}

extension VerticalAlignment {
    enum MyVertical: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }
    static let myAlignment = VerticalAlignment(MyVertical.self)
}

extension Alignment {
    static let myAlignment = Alignment(
        horizontal: .myAlignment,
        vertical: .myAlignment
    )
}

#Preview {
    ZStackCustomAlignView()
}
