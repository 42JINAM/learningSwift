//
//  TimeStampView.swift
//  ConcurrencyDemo
//
//  Created by Private on 21/05/2025.
//

import SwiftUI

struct TimeStampView: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }){
            Text("Do something")
        }
        if Task.isCancelled {
        }
    }
    func doSomething() async {
        let store = TimeStore()
        
        await withTaskGroup(of: Void.self) { group in
            for i in 1 ... 5 {
                group.addTask {
                    await store.addStamp(task: i, date: await takesTooLong())
                }
            }
            
        }
        for (task, date) in await store.timeStamps {
            print("Task = \(task), Date = \(date)")
        }
    }
}

#Preview {
    TimeStampView()
}
