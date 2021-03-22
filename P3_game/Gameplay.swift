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
            print("""
                --------------------------------------------------------------------------------
                ➡️ \(player.defaultName) Choose your nickname :
                """)
            if let playerNameChoice = readLine() {
                let nameChoice = playerNameChoice.trimmingCharacters(in: .whitespaces)
                if nameChoice.count < 3 && namesOfPlayers.contains(nameChoice) {
                    print("❌ This nickname is already taken or must have at least 3 characters")
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
            print("""
                --------------------------------------------------------------------------------
                ➡️ \(playerOne.name)'s turn
                """)
            return (attack: playerOne, defense: playerTwo)
        } else {
            print("""
                --------------------------------------------------------------------------------
                ➡️ \(playerTwo.name)'s turn
                """)
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
            print("""
                --------------------------------------------------------------------------------
                \(target.name) has \(target.life) life points remaining
                """)
        } else {
            let target = defense.selectACharacterForAction()
            attackingCharacter.action(target: target)
            if target.isAlive() {
                print("""
                --------------------------------------------------------------------------------
                ➡️ \(target.name) has \(target.life) life points remaining
                """)
            } else {
                print("""
                --------------------------------------------------------------------------------
                💀 \(target.name)'s going to the graveyard
                """)
                defense.graveyard.append(target)
            }
        }
        attackingCharacter.weapon = attackingCharacter.defaultWeapon
    }
    
    // - Function which allows to know if each member of the team is alive, if they're not we remove them from the team. When the team has no members remaining the function return false.
    private func isPlayerAlive(player: Player) -> Bool {
        for(index, character) in player.team.enumerated() {
            if character.life <= 0 {
                player.team.remove(at: index)
            }
        }
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
            print("""
            --------------------------------------------------------------------------------
            🏆 \(playerOne.name) wins the game 🏆
            --------------------------------------------------------------------------------
            """)
            print("\(playerOne.name)'s team : ")
            self.displayOriginalTeams(player: playerOne)
            print("""
            --------------------------------------------------------------------------------
            \(playerTwo.name)'s team:
            """)
            self.displayOriginalTeams(player: playerTwo)
            print("""
            --------------------------------------------------------------------------------
            Number of turns : \(self.roundCount)
            --------------------------------------------------------------------------------
            """)
        } else {
            print("""
            --------------------------------------------------------------------------------
            🏆 \(playerTwo.name) wins the game 🏆
            --------------------------------------------------------------------------------
            """)
            print("\(playerTwo.name)'s team : ")
            self.displayOriginalTeams(player: playerTwo)
            print("""
            --------------------------------------------------------------------------------
            \(playerOne.name)'s team:
            """)
            self.displayOriginalTeams(player: playerOne)
            print("""
            --------------------------------------------------------------------------------
            Number of turns : \(self.roundCount)
            --------------------------------------------------------------------------------
            """)
        }
    }
    
    // - Function that allows to display the entire team even with a dead character
    private func displayOriginalTeams(player: Player) {
        player.originalTeam.forEach { (Character) in
            print("\(Character.info())")
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
