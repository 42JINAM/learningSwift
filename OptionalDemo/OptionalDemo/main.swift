//
//  main.swift
//  OptionalDemo
//
//  Created by jinam on 4/23/25.
//

import Foundation

let myOptional: String?
myOptional = "JIHEENAM"

//nullguard
if myOptional != nil {
    let text: String = myOptional!
} else {
}

// Optional Binding
if let safeOptional = myOptional {
    let text: String = safeOptional
    let text1: String = safeOptional
}
//nil coalescing operator

let text: String = myOptional ?? "null"


struct MyOptional {
    var property = 123
    func method() {
        print("I am the struct's method.")
    }
}

let myOptional2: MyOptional?
myOptional2 = nil
//optional chaining
print(myOptional2?.property)

