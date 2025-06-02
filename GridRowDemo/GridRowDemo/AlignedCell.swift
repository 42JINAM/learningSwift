//
//  AlignedCell.swift
//  GridRowDemo
//
//  Created by Private on 02/06/2025.
//

import SwiftUI

struct AlignedCell: View {
    var body: some View {
        Grid(alignment: .topLeading) {
            GridRow(alignment: .bottom) {
                CellContent(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                    .gridColumnAlignment(.trailing)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.center)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.top)
                CellContent(index: 0, color: .yellow)
            }
            .font(.largeTitle)
            GridRow {
                CellContent(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                CellContent(index: 0, color: .yellow)
            }
            .font(.largeTitle)
            GridRow {
                ForEach(1...5, id: \.self) { index in
                    CellContent(index: index, color: .red)
                }
            }
        }
    }
}

#Preview {
    AlignedCell()
}
