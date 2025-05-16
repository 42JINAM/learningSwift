//
//  ContentView.swift
//  DemoProject
//
//  Created by Private on 15/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State var fileopen: Bool = false
    let carStack = HStack {
        Text("Car Image")
        Image(systemName: "car.fill")
    }
    
    var body: some View {
        VStack {
            MyVStack {
                Text("Text1")
                    .padding()
                    .border(Color.black)
                Text("Text2")
                    .modifier(StandardTitle())
                    .padding()
                MyHStackView()
                Button(action: buttonPressed) {
                    Text("Click me")
                }
            }
            Text("Text5")
            carStack
        }
        Label(
            title: {
                Text("Welcome to SwiftUI")
                    .font(.largeTitle)
            },
            icon: {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 25, height: 25)
            }
        )
    }
    func buttonPressed() {
        print("hello")
    }
}

struct MyHStackView: View {
    var body: some View {
        HStack {
            Text("Text3")
            Text("Text4")
        }
    }
}

#Preview ("New Iphone"){
    ContentView()
}

//#Preview {
//    ContentView()
//}
