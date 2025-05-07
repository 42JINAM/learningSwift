//
//  EmptyList.swift
//  Wishlist
//
//  Created by Private on 07/05/2025.
//

import SwiftUI

struct EmptyList: ViewModifier {
    let wishes: [Wish]
    
    func body(content: Content) -> some View {
        content.overlay {
            if wishes.isEmpty {
                ContentUnavailableView(
                    "My WishList",
                    systemImage: "heart.circle",
                    description: Text("No whishes yet. Add one to get stted.")
                )
            }
            
        }
    }
}
extension View {
    func emptyListOverlay(_ wishes: [Wish]) -> some View {
        return modifier(EmptyList(wishes: wishes))
    }
}
