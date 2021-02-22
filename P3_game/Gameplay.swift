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
    var namesOfPlayers = [String] ()
    
    init(playerOne: Player, playerTwo: Player) {
        self.playerOne = playerOne
        self.playerTwo = playerTwo
    }
    
    // - Function that allows to assign a name to each player
    func assignNameToPlayer(player: Player) -> String {
        if player.name.isEmpty {
            print("Choose your nickname : ")
            if let playerNameChoice = readLine() {
                let nameChoice = playerNameChoice.trimmingCharacters(in: .whitespaces)
                if nameChoice.count < 3 && namesOfPlayers.contains(nameChoice) {
                    print("This nickname is already taken or must have at least 3 characters")
                } else {
                    player.name = nameChoice
                    namesOfPlayers.append(nameChoice)
                }
            }
        }
        return player.name
    }
    
    // - Function that lets you know whose turn it is in relation to the number of turns
    private func whoSTurn() -> (attack: Player, defense: Player) {
        let currentTurn = roundCount % 2
        if currentTurn == 0 {
            print("Player One's turn")
            return (attack: playerOne, defense: playerTwo)
        } else {
            print("Player Two's turn")
            return (attack: playerTwo, defense: playerOne)
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
    func isPlayerAlive(player: Player) -> Bool {
        if player.team.count == 0 {
            player.isPlayerAlive = false
        }
    }
    
    // - Function that's executed while the team's still alive, we check whose turn it's and depending on the result we determine who's the attacker and who's the defender
    func battle() {
        while isPlayerAlive(player: playerOne) && isPlayerAlive(player: playerTwo) {
            let playerForTurn = self.whoSTurn()
            
            oneTurn(attack: playerForTurn.attack, defense: playerForTurn.defense)
            roundCount += 1
        }
    }
    
    // - Function that displays the winner and the stats of the characters of each team
    func gameOver() {
        if playerOne.isPlayerAlive {
            print("\(playerOne.name) wins the game")
            print("Your team : \(playerOne.team)")
            print("Loosing team : \(playerTwo.team)")
        } else {
            print("\(playerTwo.name) wins the game")
            print("Your team : \(playerTwo.team)")
            print("Loosing team : \(playerOne.team)")
        }
    }
}
