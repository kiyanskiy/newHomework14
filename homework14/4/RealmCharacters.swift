//
//  RealmCharacters.swift
//  gitHomework14
//
//  Created by Oleksandr Kiianskyi on 16.07.2021.
//

import Foundation
import RealmSwift
import UIKit
class EpisodeRealm: Object{
    @objc dynamic var name = ""
    @objc dynamic var episode = ""
}

class CharacterRealm: Object{
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var status  = ""
    @objc dynamic var species = ""
    @objc dynamic  var location = ""
    @objc dynamic var image = ""
    @objc dynamic var url = ""
    @objc dynamic var gender = ""
    @objc dynamic var imageData: Data? = nil
    var episodes = List<EpisodeRealm>()
}

