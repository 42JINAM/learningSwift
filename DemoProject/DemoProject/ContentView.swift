//
//  ContentView.swift
//  DemoProject
//
//  Created by Private on 15/05/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.landscapeRight)
                .previewLayout(.device)
                .previewDevice("iPad mini (A17 Pro)")
                .previewDisplayName("iPad")
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone")
        }
    }
}

//#Preview {
//    ContentView()
//}
