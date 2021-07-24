//
//  CharactersLoader.swift
//  homework12
//
//  Created by Oleksandr Kiianskyi on 28.06.2021.
//

import Foundation
import Alamofire


class CharactersLoader{
   
    func loadCharacters(completion: @escaping ([Character]) -> Void){
        AF.request("https://rickandmortyapi.com/api/character").response { (responseData) in guard let data = responseData.data else {return}
            do{
                let result = try JSONDecoder().decode(Results.self, from: data)
                completion(result.results)
            }catch{
                print("Error decoding: \(error)")
            }
        }
    }
    func loadCharacterDetail(url: String, completion: @escaping (Character) -> Void){
        AF.request(url).response { (responseData) in guard let data = responseData.data else {return}
            do{
                let result = try JSONDecoder().decode(Character.self, from: data)
                completion(result)
            }catch{
                print("Error decoding: \(error)")
            }
        }
    }
    
}
