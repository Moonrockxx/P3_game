//
//  Viking.swift
//  P3_game
//
//  Created by TomF on 16/02/2021.
//

import Foundation

class Viking : Character {
    
    init(name: String = "Viking") {
        super.init(defaultName: "Viking", name: name, life: 10, type: .attack, defaultWeapon: BattleAxe(), weapon: BattleAxe())
    }
    
}
