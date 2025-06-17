//
//  ContentView.swift
//  GestureDemo
//
//  Created by jinam on 6/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var magnification: CGFloat = 1
    @GestureState private var offset: CGSize = .zero
    @GestureState private var longPress: Bool = false
    
    var body: some View {
//        Image(systemName: "hand.point.right.fill")
//            .gesture(
//                TapGesture()
//                    .onEnded { _ in
//                        print("Tapped")
//                    }
//            )
        let longPressAndDrag = LongPressGesture(minimumDuration: 1.0)
            .updating($longPress) { value, state, tansition in
                state = value
            }
        let tap = TapGesture()
            .onEnded { _ in
                print("Tapped")
            }
        let longPressGesture = LongPressGesture()
            .onEnded { _ in
                print("Long Press")
            }
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged { value in
                self.magnification = value
            }
            .onEnded { _ in
                print("Gesture Ended")
            }
        let drag = DragGesture()
            .updating(self.$offset) { value, state, transaction in
                state = value.translation
            }
        Image(systemName: "hand.point.right.fill")
            .resizable()
            .font(.largeTitle)
            .scaleEffect(magnification)
            .gesture(longPressGesture)
            .gesture(magnificationGesture)
            .frame(width: 100, height: 90)
            .offset(offset)
            .gesture(drag)
            .foregroundColor(longPress ? Color.red : Color.blue)
            .gesture(longPressAndDrag)
    }
}

#Preview {
    ContentView()
}
