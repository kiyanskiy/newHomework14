//
//  AllCharactersViewController.swift
//  gitHomework14
//
//  Created by Oleksandr Kiianskyi on 16.07.2021.
//

import UIKit
import Alamofire
import RealmSwift
class AllCharactersViewController: UIViewController {
    //var characters: [Character] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
            tableView.tableFooterView = UIView()
            CharactersLoader().loadCharacters { characters in
                let allCharacters = try! Realm().objects(CharacterRealm.self)
                try! Realm().write{
                    try! Realm().delete(allCharacters)
                }
                for character in characters{
                    let newCharacter = CharacterRealm()
                    newCharacter.gender = character.gender
                    newCharacter.id = character.id
                    newCharacter.image = character.image
                    newCharacter.name = character.name
                    newCharacter.species = character.species
                    newCharacter.status = character.status
                    newCharacter.url = character.url
                    newCharacter.location = character.location.name
                    AF.request(character.image).response { response in
                        if let data = response.data {
                            try! Realm().write{ newCharacter.imageData = data }
                        }
                    }
                    try! Realm().write{
                        try! Realm().add(newCharacter)
                    }
                    
                }
            self.tableView.reloadData()
        }
       
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let currentCharacter = try! Realm().objects(CharacterRealm.self)[tableView.indexPathForSelectedRow!.row]
        (segue.destination as! CharacterViewController).characterURL = currentCharacter.url
    }


}

extension AllCharactersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let allCharacters = try! Realm().objects(CharacterRealm.self)
        if allCharacters.count > 0 {
            cell.fillCell(allCharacters[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return try! Realm().objects(CharacterRealm.self).count
    }
   
    
}
