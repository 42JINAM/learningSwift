import UIKit

extension Double {
    func round(to places: Int) -> Double {
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}

var myDouble = 3.14159
myDouble.round(to: 1)

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button.backgroundColor = .red

extension UIButton {
    func makeCircular() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}

button.makeCircular()

protocol CanSleep {
    func sleep()
}

extension CanSleep {
    func sleep() {
        print ("This object can sleep")
    }
}

class Animal {
    func eat() {
    }
}


class Bear : Animal, CanSleep {
    func sleep() {
        print("The bear can sleep in the cave.")
    }
    
    override func eat() {
        print("The bear eats something.")
    }
}

let bear = Bear()
bear.sleep()
