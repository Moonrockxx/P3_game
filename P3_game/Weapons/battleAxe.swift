//
//  BattleAxe.swift
//  P3_game
//
//  Created by TomF on 16/02/2021.
//

import Foundation

class BattleAxe : Weapon {
    
    init() {
        super.init(name: "Battle Axe", weaponType: .attack, attackPower: 40, healPower: 0)
    }
}
