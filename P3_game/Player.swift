//
//  Player.swift
//  P3_game
//
//  Created by TomF on 10/02/2021.
//

import Foundation


class Player {
    
    // - Enumeration which will allow us to return a string according to the type of character chosen
    enum CharacterType: Int, CaseIterable {
        case viking, archer, magician, fairy
        
        // - Function that allows the character to present their attributes
        func info() -> String {
            switch self {
            case .viking:
                <#code#>
            case .archer:
                <#code#>
            case .magician:
                <#code#>
            case .fairy:
                <#code#>
            default:
                <#code#>
            }
        }
    }
    
    var name: String
    var isPlayerAlive: Bool = true
    var team = [Character] ()
    
    init(name: String, isPlayerAlive: Bool) {
        self.name = name
        self.isPlayerAlive = isPlayerAlive
    }
    
    // - Function that allows to assign a name to each character
    func assignNameToCharacter() -> String {
        if let characterNameChoice = readLine() {
            let choice = characterNameChoice.trimmingCharacters(in: .whitespaces)
            // TODO: Comparer variable choice avec les propriétés name dans [team]
            if choice.count < 3 {
                print("Vous devez choisir un nom qui n'existe pas et avec 3 caractères au minimum")
            } else {
                return choice
            }
        }
        return assignNameToCharacter()
    }

    // - Function which is executed as long as the team isn't 3 members. The player chooses a character from the list and can then name him. If the name exceeds 3 characters and it's not already taken, the function add this character to the team Array
    func selectCharactersForCreateTeam(character: Character) {
        
        while team.count < 3 {
            print("""
                \(self.name) choissez un personnage à ajouter dans votre équipe :
                1 - \(String(describing: Character.info(Viking(name: ""))))
                2 - \(String(describing: Character.info(Archer(name: ""))))
                3 - \(String(describing: Character.info(Magician(name: ""))))
                4 - \(String(describing: Character.info(Fairy(name: ""))))
            """)
            
            if let characterChoice = readLine() {
                switch characterChoice {
                case "1":
                    print("You choose a Viking, give him a name :")
                    let characterName = assignNameToCharacter()
                    let characterChoosed = Viking(name: characterName)
                    team.append(characterChoosed)
                case "2":
                    print("You choose an Archer, give him a name :")
                    let characterName = assignNameToCharacter()
                    let characterChoosed = Archer(name: characterName)
                    team.append(characterChoosed)
                case "3":
                    print("You choose a Magician, give him a name :")
                    let characterName = assignNameToCharacter()
                    let characterChoosed = Magician(name: characterName)
                    team.append(characterChoosed)
                case "4":
                    print("You choose a Fairy, give her a name :")
                    let characterName = assignNameToCharacter()
                    let characterChoosed = Fairy(name: characterName)
                    team.append(characterChoosed)
                default:
                    print("Choisissez un chiffre entre 1 et 4")
                }
            }
        }
        
    }
    
    // - Function that allows players to choose a character from their team to perform an action
    func selectACharacterForAction(team: [Character]) -> Character {
        
        print("Choose à number between 1 & 3 to select a character of your team to do an action with : ")
        for(index, character) in team.enumerated() {
            print("\(index + 1)'s called \(character.name) : \(character.info(character: character))")
        }
        
        if let choice = readLine() {
            
        }
        
        return selectACharacterForAction(team: team)
    }
}
