//
//  FirstTabView.swift
//  LifecycleDemo
//
//  Created by Private on 21/05/2025.
//

import SwiftUI

struct FirstTabView: View {
    @State var title = "View One"
    
    var body: some View {
        Text(title)
            .onAppear(perform: {
                print("onApear triggered")
            })
            .onDisappear(perform: {
                print("onDisappear triggered")
            })
            .task(priority: .background) {
                title = await changeTitle()
            }
    }
    func changeTitle() async -> String {
        sleep(5)
        return "Async task complete"
    }
}

#Preview {
    FirstTabView()
}
