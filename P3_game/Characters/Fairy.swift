//
//  Fairy.swift
//  P3_game
//
//  Created by TomF on 16/02/2021.
//

import Foundation

class Fairy : Character {
    
    init(name: String) {
        super.init(name: "Fairy", life: 110, type: .heal, weapon: HealingDust())
    }
}
