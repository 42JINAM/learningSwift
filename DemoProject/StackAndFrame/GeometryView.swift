//
//  GeometryView.swift
//  DemoProject
//
//  Created by Private on 19/05/2025.
//

import SwiftUI

struct GeometryView: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack(alignment: .leading){
                Text("Hello world, how are you?")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 2,
                           height: (geometry.size.height / 4) * 3)
                    .border(Color.blue)
                Text("Goodbye World")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 4, height: geometry.size.height / 4)
                    .border(Color.green)
            }
            .border(Color.red)
        }
    }
}

#Preview {
    GeometryView()
}
