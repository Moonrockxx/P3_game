//
//  Magician.swift
//  P3_game
//
//  Created by TomF on 16/02/2021.
//

import Foundation

class Magician : Character {
    
    init(name: String = "Magician") {
        super.init(name: name, life: 70, type: .magic, weapon: FireBomb())
    }
}
