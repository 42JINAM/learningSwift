//
//  ContentView.swift
//  GridDemo
//
//  Created by Private on 02/06/2025.
//

import SwiftUI

struct ContentView: View {
    
    private var colors: [Color] = [.blue, .yellow, .green]
//    private var gridItems = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
//    private var gridItems = [GridItem(.adaptive(minimum: 50))]
    private var gridItems = [
        GridItem(.fixed(75)),
        GridItem(.fixed(75)),
        GridItem(.adaptive(minimum: 50)),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 5) {
                ForEach((0...99), id: \.self) { index in
                    CellContentView(
                        index: index,
                        color: colors[index % colors.count]
                    )
                }
            }
        }
        .padding(5)
    }
}

#Preview {
    ContentView()
}
