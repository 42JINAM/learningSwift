//
//  ContentView.swift
//  ConcurrencyDemo
//
//  Created by Private on 20/05/2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Button(action: {
            let task = Task {
                await doSomething()
            }
            if (!task.isCancelled) {
                task.cancel()
            }
        }){
            Text("Do something")
        }
    }
    func doSomething() async {
        print("Start \(Date())")
        async let result = takesTooLong(delay: 15)
        print("After async-let \(Date())")
        do {
            print("result = \(try await result)")
        } catch DurationError.tooShort {
            print("Error: Duration too short")
        } catch DurationError.tooLong {
            print("Error: Duration too long")
        } catch {
            print("Unknown error")
        }
        print("End \(Date())")

    }
    
    enum DurationError: Error {
        case tooLong
        case tooShort
    }
    
    func takesTooLong(delay: UInt32) async throws -> Date {
        if delay < 5 {
            throw DurationError.tooShort
        } else if delay > 20 {
            throw DurationError.tooLong
        }
        sleep(delay)
//        print("Async completed at \(Date())")
        return Date()
    }
}


#Preview {
    ContentView()
}
