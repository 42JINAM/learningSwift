//
//  LifecycleDemoApp.swift
//  LifecycleDemo
//
//  Created by Private on 21/05/2025.
//

import SwiftUI

@main
struct LifecycleDemoApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("Active")
            case .inactive:
                print("Inactive")
            case .background:
                print("Background")
            default:
                print("Unknown scenePhase")
            }
        }
    }
}
