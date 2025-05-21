//
//  TimeStore.swift
//  ConcurrencyDemo
//
//  Created by Private on 21/05/2025.
//

import Foundation

actor TimeStore {
    var timeStamps: [Int: Date] = [:]
    
    func addStamp(task: Int, date: Date) {
        timeStamps[task] = date
    }
}
