//
//  Gameplay.swift
//  P3_game
//
//  Created by TomF on 10/02/2021.
//

import Foundation

class Gameplay {
    
    var playerOne: Player = Player(defaultName: "Player One", name: "", isPlayerAlive: true)
    var playerTwo: Player = Player(defaultName: "Player Two", name: "", isPlayerAlive: true)
    
    var roundCount: Int = 0
    var namesOfPlayers = [String] ()
    
    // - Function that allows to assign a name to each player
    private func assignNameToPlayer(player: Player) {
        if player.name.isEmpty {
            print("\(player.defaultName) Choose your nickname : ")
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
    private func oneTurn(attack: Player, defense: Player) {
        
        let attackingCharacter = attack.selectACharacterForAction()
        
        let chest = Chest()
        chest.assignRandomWeapon(character: attackingCharacter)
        
        if let fairy = attackingCharacter as? Fairy {
            let target = attack.selectACharacterForAction()
            fairy.action(target: target)
        } else {
            let target = defense.selectACharacterForAction()
            attackingCharacter.action(target: target)
            if target.isAlive() {
                print("\(target.name) has \(target.life) remaining")
            } else {
                print("\(target.name)'s going to the graveyard")
                defense.graveyard.append(target)
            }
        }

    }
    
    // - Function which allows to know if each member of the team is alive, if they're all dead the function returns false
    private func isPlayerAlive(player: Player) -> Bool {
        if player.team.count == 0 {
            return false
        } else {
            return true
        }
    }
    
    // - Function that's executed while the team's still alive, we check whose turn it's and depending on the result we determine who's the attacker and who's the defender
    private func battle() {
        while isPlayerAlive(player: playerOne) && isPlayerAlive(player: playerTwo) {
            let playerForTurn = self.whoSTurn()
            
            oneTurn(attack: playerForTurn.attack, defense: playerForTurn.defense)
            roundCount += 1
        }
        self.gameOver()
    }
    
    // - Function that displays the winner and the stats of the characters of each team
    private func gameOver() {
        if playerOne.isPlayerAlive {
            print("\(playerOne.name) wins the game")
            print("Your team : \(playerOne.team)")
            print("Loosing team : \(playerTwo.graveyard)")
        } else {
            print("\(playerTwo.name) wins the game")
            print("Your team : \(playerTwo.team)")
            print("Loosing team : \(playerOne.graveyard)")
        }
    }
    
    // - Function that initialize the game by assign names for both players, each players pick 3 characters to start the battle
    func start() {
        self.assignNameToPlayer(player: playerOne)
        self.assignNameToPlayer(player: playerTwo)
        
        playerOne.selectCharactersForCreateTeam()
        playerTwo.selectCharactersForCreateTeam()
        
        battle()
        
    }
}
