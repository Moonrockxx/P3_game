//
//  HealingDust.swift
//  P3_game
//
//  Created by TomF on 16/02/2021.
//

import Foundation

class HealingDust : Weapon {
    
    init() {
        super.init(name: "Healing Dust", weaponType: .heal, attackPower: 0, healPower: 35)
    }
    
}
