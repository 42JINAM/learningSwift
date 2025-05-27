//
//  PhiloInputRow.swift
//  Philosopers
//
//  Created by Private on 27/05/2025.
//

import SwiftUI

struct PhiloInputRow: View {
    let label: String
    @Binding var value: Int
    
    var body: some View {
        HStack {
            Text(label)
            TextField(label, value: $value, format: .number)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            
            
        }
    }
}

#Preview {
    @State var number: Int = 4
    PhiloInputRow(label: "hi", value: $number)
}
