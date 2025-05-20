//
//  TaskGroupView.swift
//  ConcurrencyDemo
//
//  Created by Private on 20/05/2025.
//

import SwiftUI

struct TaskGroupView: View {
    var body: some View {
        Button(action: {
            let task = Task {
                await doSomething()
            }
        }){
            Text("Do something")
        }
    }
    func doSomething() async {
        print("start: \(Date())")
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    let result = await takesTooLong()
                    print("Completed Task \(i) = \(result)")
                }
            }
        }
    }
    
    enum DurationError: Error {
        case tooLong
        case tooShort
    }
    
//    func takesTooLong() async -> Date {
//        try? await Task.sleep(nanoseconds: 5_000_000_000)
//        return Date()
//    }
}

#Preview {
    TaskGroupView()
}
