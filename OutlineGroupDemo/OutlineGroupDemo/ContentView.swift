//
//  ContentView.swift
//  OutlineGroupDemo
//
//  Created by Private on 30/05/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(carItems) { carItem in
                Section(carItem.name) {
                    OutlineGroup(carItem.children ?? [CarInfo](), children: \.children)
                    { child in
                        CellView(item: child)
                    }
                }
            }
        }
        .listStyle(InsetListStyle())
    }
}

#Preview {
    ContentView()
}
