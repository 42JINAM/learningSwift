//
//  Enemy.swift
//  ClassesDemo
//
//  Created by jinam on 4/23/25.
//

class Enemy {
    var health: Int
    var attackStrength: Int
    
    init(health: Int, attackStrength: Int) {
        self.health = health
        self.attackStrength = attackStrength
    }
    func    takeDamage(amount: Int) {
        health -= amount
    }
    func    move() {
        print("Walk forwards.")
    }
    func    attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}
