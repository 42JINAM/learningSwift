//: [Previous](@previous)

import Foundation

var nameArray = [String](repeating: "My string", count: 10)

print(nameArray)

var treeAarry = ["Apple", "Banana", "Orange"]

let suffledTree = treeAarry.shuffled()
//: [Next](@next)
print(suffledTree)
treeAarry.remove(at: 2)
treeAarry.insert("Maple", at: 0)
treeAarry.forEach { tree in
        print(tree)
}

var mixedArray: [Any] = ["Apple", 2, true, 3.14]



print(mixedArray)

let keys = ["a", "b", "c"]
let values = [1, 2, 3]
let dict = Dictionary(uniqueKeysWithValues: zip(keys, values))

let values2: [Int] = [1, 2, 3, 4]
var dict2 = Dictionary(uniqueKeysWithValues: zip(1..., values2))
print(dict2.count)
print(dict2[5, default: -1])

dict2.removeValue(forKey: 1)

