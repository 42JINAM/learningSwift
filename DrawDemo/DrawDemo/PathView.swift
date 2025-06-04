//
//  PathView.swift
//  DrawDemo
//
//  Created by Private on 02/06/2025.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 10, y: 0))
            path.addLine(to: CGPoint(x:10, y:300))
            path.addLine(to: CGPoint(x:300, y:300))
            path.closeSubpath()
        }
        .fill(.green)
        MyShape()
            .fill(.red)
            .frame(width: 360, height: 350)
        Circle()
            .fill(.blue.shadow(.drop(color: .black, radius: 10)))
            .frame(width: 200, height: 200)
        Circle()
            .fill(.blue.shadow(.inner(color: .white, radius: 5)))
            .frame(width: 200, height: 200)
    }
}

#Preview {
    PathView()
}
