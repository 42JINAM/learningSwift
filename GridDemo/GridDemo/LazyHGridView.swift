//
//  LazyHGridView.swift
//  GridDemo
//
//  Created by Private on 02/06/2025.
//

import SwiftUI

struct LazyHGridView: View {
    private var colors: [Color] = [.blue, .yellow, .green]
    private var gridItems1 = [GridItem(.adaptive(minimum: 50))]
    private var gridItems2 = [
        GridItem(.fixed(150)),
        GridItem(.flexible(minimum: 50)),
        GridItem(.fixed(150))
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems1, spacing: 5) {
                ForEach((0...99), id: \.self) { index in
                    CellContentView(
                        index: index,
                        color: colors[index % colors.count]
                    )
                }
                .padding(5)
            }
        }
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems2, spacing: 5) {
                ForEach((0...99), id: \.self) { index in
                    CellContentView(
                        index: index,
                        color: colors[index % colors.count]
                    )
                }
                .padding(5)
            }
        }
    }
    struct CellContentView: View {
        var index: Int
        var color: Color
        
        var body: some View {
            Text("\(index)")
                .frame(minWidth: 75, minHeight: 50, maxHeight: .infinity)
                .background(color)
                .cornerRadius(8)
                .font(.system(.largeTitle))
        }
    }
}

#Preview {
    LazyHGridView()
}
