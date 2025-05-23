//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct ExampleView: View {
    @State private var rotation: Double = 0
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 2), value: rotation)
            Button(action: {
                rotation = (rotation < 360 ? rotation + 60 : 0)
            }) {
                Text("Rotate")
            }
        }
        .padding(18)
    }
}
PlaygroundPage.current.setLiveView(ExampleView().padding())
//: [Next](@next)
