import UIKit

func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

func add(n1: Int, n2: Int) -> Int {
    return n1 + n2
}

//func multiply(n1: Int, n2: Int) -> Int {
//    return n1 * n2
//}

calculator(n1: 1, n2: 2, operation: add)
calculator(n1: 1, n2: 2, operation: {(n1: Int, n2: Int) -> Int in
    return n1 * n2
})

let result = calculator(n1: 1, n2: 2, operation: {(no1, no2) in no1 * no2})
let result1 = calculator(n1: 1, n2: 2, operation: {$0 * $1})
let result2 = calculator(n1: 1, n2: 2) {$0 * $1}


let array = [6,2,3,9,4,1]

func addOne (n1: Int) -> Int {
    return n1 + 1
}

array.map(addOne)
array.map({(n1) in n1 + 1})
let newArray = array.map({$0 + 1})
let stringArray = array.map({"\($0)"})
print(stringArray)
