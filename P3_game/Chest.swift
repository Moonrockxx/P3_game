//
//  Chest.swift
//  P3_game
//
//  Created by TomF on 10/02/2021.
//

import Foundation

class Chest {
    
    // - Enumeration who allows to check that the type of weapon in the chest matches the type of character playing
    enum randomWeaponType: Int {
        case attack = 1
        case magic = 2
        case heal = 3
    }
    
    // - Initialization of weapons in the chest
    let attackWeapon = Weapon(name: "Legendary Sword", weaponType: .attack, attackPower: 55, healPower: 0)
    let magicWeapon = Weapon(name: "Celestial Lightening", weaponType: .magic, attackPower: 60, healPower: 0)
    let healWeapon = Weapon(name: "Elf Blood", weaponType: .heal, attackPower: 0, healPower: 55)
    
    // - Check if the chest appear or not
    private func isChestHere() -> Bool {
        let randomAppear = Int.random(in: 1...100)
        if randomAppear <= 50 {
            print("A magic chest appears")
        }
    }
    
    // - Check that the type of weapon in the chest matches the type of character playing
    func twoTypesMatch() -> Bool {
        
    }
    
    // - Returns a random number between 1 and 4 corresponding to a chest weapon
    func getRandomWeapon() -> Weapon {
        if self.isChestHere() {
            let randomChestContent = Int.random(in: 1...4)
            switch randomChestContent {
            case 1:
                <#code#>
            case 2:
                <#code#>
            case 3:
                <#code#>
            case 4:
                <#code#>
            default:
                print(" ")
            }
        }
    }
}
