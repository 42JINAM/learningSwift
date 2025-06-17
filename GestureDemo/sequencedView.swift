//
//  sequencedView.swift
//  GestureDemo
//
//  Created by jinam on 6/17/25.
//

import SwiftUI

struct sequencedView: View {
    @GestureState private var offset: CGSize = .zero
    @State private var dragEnded: Bool = false
    
    var body: some View {
        let longPressBeforeDrag = LongPressGesture(minimumDuration: 2.0)
            .onEnded { _ in
                self.dragEnded = true
            }
            .sequenced(before: DragGesture())
            .updating($offset) { value, state, transaction in
                switch value {
                case .first(true) :
                    print("Long press in progress")
                case .second(true, let drag) :
                    state = drag?.translation ?? .zero
                default :
                    break
                }
            }
            .onEnded { value in
                self.dragEnded = false
            }
        return Image(systemName: "hand.point.right.fill")
            .foregroundColor(dragEnded ? .green : .red)
            .font(.largeTitle)
            .offset(offset)
            .gesture(longPressBeforeDrag)
    }
}

#Preview {
    sequencedView()
}
