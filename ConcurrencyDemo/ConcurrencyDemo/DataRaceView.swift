//
//  DataRaceView.swift
//  ConcurrencyDemo
//
//  Created by Private on 20/05/2025.
//

import SwiftUI

struct DataRaceView: View {
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
        var timeStamps: [Int: Date] = [:]
        
        await withTaskGroup(of: (Int, Date).self) { group in
            for i in 1 ... 5 {
                group.addTask {
                    return(i, await takesTooLong())
                }
            }
            for await (task, date) in group {
                timeStamps[task] = date
            }
        }
        for (task, date) in timeStamps {
            print("Task = \(task), Date = \(date)")
        }
    }
}

#Preview {
    DataRaceView()
}
