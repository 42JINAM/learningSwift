//
//  FrameView.swift
//  DemoProject
//
//  Created by Private on 19/05/2025.
//

import SwiftUI

struct FrameView: View {
    var body: some View {
        Text("Hello World 123 456 789 012 345 678")
            .font(.largeTitle)
            .border(Color.black)
//            .frame(width: 100, height: 100, alignment: .center)
            .frame(
                minWidth: 100,
                maxWidth: .infinity,
                minHeight: 100,
                maxHeight: 100,
                alignment: .center
            )
            .border(Color.red, width: 5)
    }
}

#Preview {
    FrameView()
}
