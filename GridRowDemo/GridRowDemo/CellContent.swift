//
//  CellContent.swift
//  GridRowDemo
//
//  Created by Private on 02/06/2025.
//

import SwiftUI

struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}
