//
//  Player.swift
//  P3_game
//
//  Created by TomF on 10/02/2021.
//

import Foundation


class Player {
    
    let defaultName: String
    var name: String
    var isPlayerAlive: Bool = true
    var team = [Character] ()
    var graveyard = [Character] ()
    var allCharactersName = [String] ()
    
    init(defaultName: String, name: String, isPlayerAlive: Bool) {
        self.defaultName = defaultName
        self.name = name
        self.isPlayerAlive = isPlayerAlive
    }
    
    
    // - Function that allows to assign a name to each character
    private func assignNameToCharacter() -> String {
        if let characterNameChoice = readLine() {
            let choice = characterNameChoice.trimmingCharacters(in: .whitespaces)
            if choice.count < 3 || allCharactersName.contains(choice) {
                print("You must choose a name that does not exist and with at least 3 characters")
            } else {
                return choice
            }
        }
        return assignNameToCharacter()
    }
    
    /*
     Function which is executed as long as the team isn't 3 members. The player chooses
     a character from the list and can then name him. If the name exceeds 3 characters and it's
     not already taken, the function add this character to the team Array
     */
    func selectCharactersForCreateTeam() {
        
        let viking = Viking(name: "Viking")
        let archer = Archer(name: "Archer")
        let magician = Magician(name: "Magician")
        let fairy = Fairy(name: "Fairy")
        
        while team.count < 3 {
            print("""
            ---------------------------------------------------------
                \(self.name) choose a character to add to your team :
                1 - \(viking.info()) \(viking.weapon.weaponInfo())
                2 - \(archer.info()) \(archer.weapon.weaponInfo())
                3 - \(magician.info()) \(magician.weapon.weaponInfo())
                4 - \(fairy.info()) \(fairy.weapon.weaponInfo())
            ---------------------------------------------------------
            """)
            
            if let characterChoice = readLine() {
                switch characterChoice {
                case "1":
                    print("""
                    ---------------------------------------------------------
                    You choose a Viking, give him a name :
                    """)
                    let characterName = assignNameToCharacter()
                    allCharactersName.append(characterName)
                    let characterChoosed = Viking(name: characterName)
                    team.append(characterChoosed)
                    print("""
                    Your viking's called \(characterName)
                    """)
                case "2":
                    print("""
                    ---------------------------------------------------------
                    You choose an Archer, give him a name :
                    """)
                    let characterName = assignNameToCharacter()
                    allCharactersName.append(characterName)
                    let characterChoosed = Archer(name: characterName)
                    team.append(characterChoosed)
                    print("""
                    Your archer's called \(characterName)
                    """)
                case "3":
                    print("""
                    ---------------------------------------------------------
                    You choose a Magician, give him a name :
                    """)
                    let characterName = assignNameToCharacter()
                    allCharactersName.append(characterName)
                    let characterChoosed = Magician(name: characterName)
                    team.append(characterChoosed)
                    print("""
                    Your magician's called \(characterName)
                    """)
                case "4":
                    print("""
                    ---------------------------------------------------------
                    You choose a Fairy, give him a name :
                    """)
                    let characterName = assignNameToCharacter()
                    allCharactersName.append(characterName)
                    let characterChoosed = Fairy(name: characterName)
                    team.append(characterChoosed)
                    print("""
                    Your fairy's called \(characterName)
                    """)
                default:
                    print("Choose a number between 1 and 4")
                }
            }
        }
    }
    
    /*
     Function that allows players to choose a character from their team to perform an action.
     It displays the list of team characters and reads the player's choice. We check that the
     choice is between 1 or the number of characters remaining in the team so as not to choose a dead character
     */
    func selectACharacterForAction() -> Character {
        print("""
            ---------------------------------------------------------
            Choose à number between 1 & 3 to select a character of your team to do an action with :
            """)
        for(index, character) in team.enumerated() {
            print("\(index + 1) is a \(character.defaultName) : \(character.info())")
        }
        if let choice = readLine() {
            if let intChoice = Int(choice) {
                if intChoice >= 1 && intChoice <= team.count {
                    return team[intChoice - 1]
                }
            }
        }
        return selectACharacterForAction()
    }
}
