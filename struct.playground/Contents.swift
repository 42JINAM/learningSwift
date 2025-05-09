import UIKit

struct Rectangle {
    var width: Double
    var height: Double
    
    var area: Double {
        get {
            return width * height
        }
        set {
            height = newValue / width
        }
    }
}

var rectangle = Rectangle(width: 5.0, height: 10.0)
