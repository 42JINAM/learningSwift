import UIKit

class Animal {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Human: Animal {
    func code() {
        print("Typing away ...")
    }
}

class fish: Animal {
    func breatheUnderWater() {
        print("Breathing underwater ...")
    }
}

let angela = Human(name: "Angela")
let jack = Human(name: "Jack bauer")
let nemo = fish(name: "Nemo")

let neighbours: [Animal] = [angela, jack, nemo]

let num: NSNumber = 123
let word: NSString = "abc"

let things = [num, word]

