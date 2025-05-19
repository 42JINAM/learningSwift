//
//  LineLimit.swift
//  DemoProject
//
//  Created by Private on 19/05/2025.
//

import SwiftUI

struct LineLimit: View {
    var body: some View {
        HStack
        {
            Image(systemName: "airplane")
            Text("Flight times:                                                     ")
                .layoutPriority(2)
            Text("London123123                                                                                   xxxxxx")
                .layoutPriority(1)
        }
        .lineLimit(1)
    }
}

#Preview {
    LineLimit()
}
