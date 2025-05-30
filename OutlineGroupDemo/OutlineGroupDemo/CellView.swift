//
//  CellView.swift
//  OutlineGroupDemo
//
//  Created by Private on 30/05/2025.
//

import SwiftUI

struct CellView: View {
    var item: CarInfo
    
    var body: some View {
        HStack {
            Image(systemName: item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(.green)
            Text(item.name)
            
        }
    }
}

#Preview {
    CellView(item: CarInfo(name: "Tesla", image: "leaf.fill"))
}
