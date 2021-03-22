//
//  Fairy.swift
//  P3_game
//
//  Created by TomF on 16/02/2021.
//

import Foundation

class Fairy : Character {
    
    init(name: String = "Fairy") {
        super.init(defaultName: "Fairy", name: name, life: 11, type: .heal, defaultWeapon: HealingDust(), weapon: HealingDust())
    }
    
}
