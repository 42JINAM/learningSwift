//
//  PowApp.swift
//  Pow
//
//  Created by Private on 08/05/2025.
//

import SwiftUI
import SwiftData

@main
struct PowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}
