//
//  Dragon.swift
//  ClassesDemo
//
//  Created by jinam on 4/23/25.
//

import Foundation

class Dragon: Enemy {
    var wingSpan = 2
    
    func    talk(speech:String) {
        print("Says : \(speech)")
    }
    override func move() {
        print("Fly forwards")
    }
    override func attack() {
        super.attack()
        print("Spits fire, does 10 damage.")
    }
}
