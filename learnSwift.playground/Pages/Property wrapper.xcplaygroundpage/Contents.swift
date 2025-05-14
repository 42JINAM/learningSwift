//: [Previous](@previous)

import Foundation

struct Address {
    @FixCase var city: String
    @FixCase var name: String
    @FixCase var country: String
    
//    var city: String {
//        get { cityname }
//        set { cityname = newValue.uppercased()}
//    }
}

@propertyWrapper
struct FixCase {
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }
}

var address = Address()
address.city = "london"
//print(address.city)
//: [Next](@next)

@propertyWrapper
struct MinMaxVal<V: Comparable> {
    var value: V
    let min: V
    let max: V
    
    init(wrappedValue: V, min: V, max: V) {
        self.value = wrappedValue
        self.min = min
        self.max = max
    }
    
    var wrappedValue: V {
        get { value }
        set {
            if newValue < min {
                value = min
            } else if newValue > max {
                value = max
            } else {
                value = newValue
            }
        }
    }
}

struct Demo {
//    @MinMaxVal(min: 100, max: 200) var value: Int = 100
    @MinMaxVal(min: "Apple", max: "Orange") var value: String = "Apple"
}

var demo = Demo()
//demo.value = 150
//print(demo.value)
//demo.value = 300
//print(demo.value)

demo.value = "Banana"
print(demo.value)

demo.value = "Pear"
print(demo.value)

struct DateDemo {
    @MinMaxVal(
        min: Date(),
        max: Calendar.current.date(byAdding: .month, value: 1, to: Date())!
    ) var value: Date = Date()
}

var dateDemo = DateDemo()

dateDemo.value = Calendar.current.date(byAdding: .month, value: 12, to: Date())!
print(dateDemo.value)
