//
//  Gameplay.swift
//  P3_game
//
//  Created by TomF on 10/02/2021.
//

import Foundation

class Gameplay {
    
    var playerOne: Player
    var playerTwo: Player
    
    var roundCount: Int = 1
    
    init(playerOne: Player, playerTwo: Player) {
        self.playerOne = playerOne
        self.playerTwo = playerTwo
    }
    
    // - Function that allows to assign a name to each player
    func assignNameToPlayer(player: Player) -> String {
        
    }
    
    // - Function that lets you know whose turn it is in relation to the number of turns
    func whoSTurn() -> Player {
        let currentTurn = roundCount % 2
        if currentTurn == 0 {
            return playerOne
        } else {
            return playerTwo
        }
    }
    
    // - Function who describe a turn
    func oneTurn(attack: Player, defense: Player) {
        //- Apparition du coffre ?
        //- Si l'arme est de même type on l'assigne
        
        let attackingCharacter = attack.selectACharacterForAction(team: attack.team)
        
        if let fairy = attackingCharacter as? Fairy {
            let target = attack.selectACharacterForAction(team: attack.team)
            fairy.action(target: target)
        } else {
            let target = attack.selectACharacterForAction(team: defense.team)
            attackingCharacter.action(target: target)
        }
    }
    
    // - Function which allows to know if each member of the team is alive, if they're all dead the function returns false
    func isTeamAlive(player: Player) -> Bool {
        
    }
    
    // - Function that's executed while the team's still alive, we check whose turn it's and depending on the result we determine who's the attacker and who's the defender
    func battle() {
        while isTeamAlive(player: playerOne) && isTeamAlive(player: playerTwo) {
            let playerForTurn = self.whoSTurn()
            if playerForTurn === playerOne {
                print("Player One's turn")
                oneTurn(attack: playerOne, defense: playerTwo)
                roundCount += 1
            } else {
                print("Player Two's turn")
                oneTurn(attack: playerTwo, defense: playerOne)
                roundCount += 1
            }
        }
    }
    
    // - Function that displays the winner and the stats of the characters of each team
    func gameOver() {
        
    }
}
