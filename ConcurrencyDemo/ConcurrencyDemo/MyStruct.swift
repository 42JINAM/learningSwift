//
//  MyStruct.swift
//  ConcurrencyDemo
//
//  Created by Private on 20/05/2025.
//

import Foundation

struct MyStruct {
    var myResult: Date {
        get async {
            return await self.getTime()
        }
    }
    func getTime() async -> Date {
        sleep(5)
        return Date()
    }
}

func doSomething() async {
    let myStruct = MyStruct()
    
    Task {
        let date = await myStruct.myResult
        print(date)
    }
}
