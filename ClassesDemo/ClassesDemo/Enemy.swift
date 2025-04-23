//
//  Enemy.swift
//  ClassesDemo
//
//  Created by jinam on 4/23/25.
//

class Enemy {
    var health = 100
    var attackStrength = 10
    
    func    move() {
        print("Walk forwards.")
    }
    func    attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}
