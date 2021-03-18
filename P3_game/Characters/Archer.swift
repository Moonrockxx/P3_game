//
//  Archer.swift
//  P3_game
//
//  Created by TomF on 16/02/2021.
//

import Foundation

class Archer : Character {
    
    init(name: String = "Archer") {
        super.init(defaultName: "Archer", name: name, life: 120, type: .attack, weapon: LightBow())
    }
}
