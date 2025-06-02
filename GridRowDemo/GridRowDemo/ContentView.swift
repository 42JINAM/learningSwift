//
//  ContentView.swift
//  GridRowDemo
//
//  Created by Private on 02/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid {
            GridRow {
                ForEach(1...5, id: \.self) { index in
                    if (index % 2 == 1) {
                        CellContent(index: index, color: .red)
                    } else {
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                }
            }
            
            GridRow {
                ForEach(6...10, id:\.self) { index in
                    CellContent(index: index, color: .blue)
                }
            }
            
            GridRow {
                ForEach(11...15, id: \.self) { index in
                    CellContent(index: index, color: .green)
                }
            }
            CellContent(index: 16, color: .blue)
            GridRow {
                CellContent(index: 17, color: .orange)
                    .gridCellColumns(2)
                CellContent(index: 18, color: .indigo)
                    .gridCellColumns(3)
            }
        }
    }
}

#Preview {
    ContentView()
}
