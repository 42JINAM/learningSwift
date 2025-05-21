//
//  Utils.swift
//  ConcurrencyDemo
//
//  Created by Private on 20/05/2025.
//

import Foundation

func takesTooLong() async -> Date {
    try? await Task.sleep(nanoseconds: 5_000_000)
    return Date()
}
