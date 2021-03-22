//
//  Magician.swift
//  P3_game
//
//  Created by TomF on 16/02/2021.
//

import Foundation

class Magician : Character {
    
    init(name: String = "Magician") {
        super.init(defaultName: "Magician", name: name, life: 7, type: .magic, defaultWeapon: FireBomb(), weapon: FireBomb())
    }
    
}
