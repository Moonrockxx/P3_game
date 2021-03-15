//
//  Fairy.swift
//  P3_game
//
//  Created by TomF on 16/02/2021.
//

import Foundation

class Fairy : Character {
    init(name: String = "Fairy") {
        super.init(name: name, life: 110, type: .heal, weapon: HealingDust())
    }
}
