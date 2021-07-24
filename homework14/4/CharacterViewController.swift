//
//  CharacterViewController.swift
//  homework12
//
//  Created by Oleksandr Kiianskyi on 29.06.2021.
//

import UIKit
import Alamofire

class CharacterViewController: UIViewController {
    var characterURL: String?
    var characterInfo: Character?
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var episodesHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var episodesView: UIView!
    @IBOutlet weak var statusIconView: UIView!
    @IBOutlet weak var speciesAndGenderLabel: UILabel!
    @IBOutlet weak var lastLocationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstEpisode: UILabel!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            if let URL = self.characterURL{
            CharactersLoader().loadCharacterDetail(url: URL){ character in
                self.characterInfo = character
                if let currentCharacter = self.characterInfo{
                    self.nameLabel.text = currentCharacter.name
                    self.lastLocationLabel.text = currentCharacter.location.name
                    self.statusLabel.text = currentCharacter.status
                    self.speciesAndGenderLabel.text = "\(currentCharacter.species)(\(currentCharacter.gender))"
                    self.statusIconView.layer.cornerRadius = 5
                    AF.request(currentCharacter.image).response { response in
                        if let data = response.data {
                            self.characterImageView.image = UIImage(data: data)
                        }
                    }
                    switch currentCharacter.status {
                    case "Dead":
                        self.statusIconView.backgroundColor = .red
                    case "unknown":
                        self.statusIconView.backgroundColor = .orange
                    default:
                        self.statusIconView.backgroundColor = .green
                    }
                    var first = true
                    self.episodesHeightConstraint.constant = CGFloat(currentCharacter.episode.count * 30)
                    for (index,episodeUrl) in currentCharacter.episode.enumerated(){
                        AF.request(episodeUrl).response { (responseData) in guard let data = responseData.data else {return}
                            do{
                                let episode = try JSONDecoder().decode(Episode.self, from: data)
                                if first{
                                    self.firstEpisode.text = episode.name
                                    first = false
                                }
                                let nameLabel = UILabel(frame: CGRect(x: 8, y: CGFloat(index) * 30, width: self.episodesView.frame.width / 2 - 8, height: 20))
                                nameLabel.text = episode.name
                                self.episodesView.addSubview(nameLabel)
                                let episodeLabel = UILabel(frame: CGRect(x: self.episodesView.frame.width / 2, y: CGFloat(index) * 30, width: self.episodesView.frame.width / 2 - 8, height: 20))
                                episodeLabel.text = episode.episode
                                episodeLabel.textAlignment = .right
                                self.episodesView.addSubview(episodeLabel)
                            }catch{
                                print("Error decoding: \(error)")
                            }
                        }
                        
                    }
                   
                }
            }
        }
    }
}
    

