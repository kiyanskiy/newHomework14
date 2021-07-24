//
//  Character.swift
//  homework12
//
//  Created by Oleksandr Kiianskyi on 28.06.2021.
//

import Foundation
import Alamofire

struct Episode: Codable{
    let name: String
    let episode: String
}
struct Results: Codable {
    let results: [Character]
}
struct Character: Codable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let location: Location
    let image: String
    let url: String
    let gender: String
    let episode: [String]

    
}

struct Location: Codable{
    let name: String
}
