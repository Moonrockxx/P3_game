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
    
    var name: String
    var life: Int
    var type: characterType
    var weapon: Weapon
    
    var minLife: Int = 0
    var isAlive: Bool = true
    
    init(name: String, life: Int, type: characterType, weapon: Weapon) {
        self.name = name
        self.type = type
        self.life = life
        self.weapon = weapon
    }
    
    // - Function that presents the attributes of a character
    func info(character: Character) {
        print("\(character.name) - Life : \(character.life) - Weapon : \(character.weapon)")
    }
    
    // - Function that allows to remove life points from the opponent or add them to allies depending on the type of character chosen
    func action(target: Character) {
        if self.type == .attack || self.type == .magic {
            target.life -= self.weapon.attackPower
        } else {
            target.life += self.weapon.healPower
        }
    }
}
