//
//  Character.swift
//  P3_game
//
//  Created by TomF on 10/02/2021.
//

import Foundation

class Character {
    
    // - Enumeration who allows to check that the type of weapon in the chest matches the type of character playing
    enum characterType: Int {
        case attack = 1
        case magic = 2
        case heal = 3
    }
    
    let defaultName: String
    let name: String
    var life: Int
    let type: characterType
    var weapon: Weapon
    
//    var minLife: Int = 0
//    var isAlive: Bool = true
    
    init(defaultName: String, name: String, life: Int, type: characterType, weapon: Weapon) {
        self.defaultName = defaultName
        self.name = name
        self.type = type
        self.life = life
        self.weapon = weapon
    }
    
    // - Function that check if the characters is alive and return a boolean
    func isAlive() -> Bool {
        return self.life > 0
    }
    
    // - Function that presents the attributes of a character
    func info() -> String {
        return "\(self.name) - Life : \(self.life) - Weapon : \(self.weapon.name) \(self.weapon.weaponInfo())"
    }
    
    // - Function that allows to remove life points from the opponent or add them to allies depending on the type of character chosen. If life points are negative they return to 0
    func action(target: Character) {
        if self.type == .attack || self.type == .magic {
            target.life.sub(value: self.weapon.attackPower, min: 0)
        } else {
            target.life += self.weapon.healPower
        }
    }
}

    // - Extension that not allows negative value
extension Int {
    mutating func sub(value: Int, min: Int) {
        if (self - value) <= min {
            self = min
        } else {
            self -= value
        }
    }
}
