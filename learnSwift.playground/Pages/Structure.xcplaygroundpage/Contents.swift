//: [Previous](@previous)

import Foundation

struct SampleStruct {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildHelloMsg() {
        "Hello " + name
    }
}
//: enum

enum Temperature {
    case hot
    case cold(centigrade: Int)
    case warm
}

func displayTemperature(_ temp: Temperature) -> String {
    switch temp {
    case .hot:
        return "It is hot"
    case .cold:
        return "It is cold"
    case .warm:
        return "It is warm"
    case .cold(let centigrade) where centigrade < 0:
        return "Ice warning: \(centigrade) degrees"
    }
}

print(displayTemperature(.hot))
print(displayTemperature(.cold(centigrade: -10)))
//: [Next](@next)
