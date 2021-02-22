//
//  Tools.swift
//  P3_game
//
//  Created by TomF on 10/02/2021.
//

import Foundation

class Tools {
    
    func selectCharacter(){
        // Permettent de donner les indication à l’utilisateur pour selectionner ses 3 personnages!
        print("\nSuivez les instructions suivantes pour choisir vos personnages !”
            + "\nTapez :un:. Pour choisir un Sniper :fléchette: ”
          + “\nTapez :deux:. Pour choisir un Medecin :casque_avec_croix_blanche:”
          + “\nTapez :trois:. Pour choisir un Soldat :boum:”
          + “\nTapez :quatre:. Pour choisir un Capitaine :pilote_homme::couleur_de_peau-2: ”
          + “\nTapez :cinq:. Pour choisir un Soutien :casque_militaire: ”
          + “\nTapez :zéro:. :sens_interdit:️ Pour recommencer :flèche_vers_la_gauche_avec_crochet: !“)
        for player in players{ //🎗 Pour chaque joueur dans la liste,
          print(“\n\n:homme_levant_la_main::couleur_de_peau-3: \(player.name), à toi de selectionner tes 3 personnages pour composer ton équipe !“)
          while player.team.count < numberOfCharacters{ // 🎗 je boucle Tant que le nombre de personnage par équipe est inferieur à 3
            print(“\n:cloche: Choisis ton personnage n°\(player.team.count + 1) dans la liste ci dessus :“)
            if let choices = readLine() {
              switch choices {
              case "1":
                player.team.append(Medic())
                inputName(characters: Medic())
              case "2":
                player.team.append(Sniper())
                inputName(characters: Sniper())
              case "3":
                player.team.append(AssaultSoldier())
                inputName(characters: AssaultSoldier())
              case "4":
                player.team.append(Captain())
                inputName(characters: Captain())
              case "5":
                player.team.append(Support())
                inputName(characters: Support())
              case "0":
                selectCharacter()
              default:
                print(“:x: Tu dois selectionner 3 personnages parmi la liste !“)
                selectCharacter() // On recommence l’action !
              }
            }
          }
        }
      }
    // :golf:️ Permet de demander et d’attribuer un nom à chaque personnage d’une équipe !
      func inputName(characters: Character){
        print(“:buste_silhouette: Donne un nom à ton personnage : “)
        if let name = readLine(){
          characters.name = name
          if charactersName.contains(name){ //🎗 Si le tableau 'CharcatersName' contien 2 fois le même nom
            print(“:x: Ce nom existe déjà, tu dois donner un autre nom à ton personnage !“) //:ruban: j’affiche le message !
            inputName(characters: characters) //:ruban: et on recommence l’action tant que le nom n’est pas diffrent !
          } else {
            charactersName.append(name) //:ruban: Si c’est ok, on stock le nom dans le tableau et on passe au suivant !
            characters.name.append(name) //:ruban: et le nom est donnée ensuite au personnage choisi !
          }
        }
      }
    
}
