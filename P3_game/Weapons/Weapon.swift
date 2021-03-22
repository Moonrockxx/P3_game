//
//  Weapon.swift
//  P3_game
//
//  Created by TomF on 10/02/2021.
//

import Foundation

class Weapon {
    
    enum WeaponType: Int {
        case attack = 1
        case magic = 2
        case heal = 3
    }
    
    var name: String
    var weaponType: WeaponType
    var attackPower: Int
    var healPower: Int
    
    init(name: String, weaponType: WeaponType, attackPower: Int, healPower: Int) {
        self.name = name
        self.weaponType = weaponType
        self.attackPower = attackPower
        self.healPower = healPower
    }
    
    // - Give the weapon informations
    func weaponInfo() -> String {
        return "--> Attack Power : \(self.attackPower) - Heal Power : \(self.healPower)"
    }
}
