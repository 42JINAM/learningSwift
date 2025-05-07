//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Private on 07/05/2025.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for:Wish.self)
        }
    }
}
