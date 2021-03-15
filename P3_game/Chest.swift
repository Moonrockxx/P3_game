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
            return true
        } else {
            print("No magic chest appears")
            return false
        }
    }
    
    // - Assign a random weapon to a character according to his type
    func assignRandomWeapon(character: Character) {
        if self.isChestHere() {
            let randomChestContent = Int.random(in: 1...3)
            switch randomChestContent {
            case 1:
                print("\(character.name) found a Legendary Sword")
                if character.type != .attack {
                    print("Cannot assign an attack weapon to healing or magic characters")
                } else {
                    character.weapon = attackWeapon
                }
            case 2:
                print("\(character.name) found a Celestial Lightening")
                if character.type != .magic {
                    print("Cannot assign a magic weapon to attack or healing characters")
                } else {
                    character.weapon = attackWeapon
                }
            case 3:
                print("\(character.name) found Elf Blood")
                if character.type != .heal {
                    print("Cannot assign an heal weapon to attack or magic characters")
                } else {
                    character.weapon = attackWeapon
                }
            default:
                print("Can't process")
            }
        }
    }
}
