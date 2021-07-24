//
//  Human.swift
//  homework14Git
//
//  Created by Oleksandr Kiianskyi on 16.07.2021.
//

import Foundation

class Human{
    static let shared = Human()
    private let kNameKey = "Human.kNameKey"
    private let kSurnameKey = "Human.kSurnameKey"
    var name: String? {
        set { UserDefaults.standard.set(newValue, forKey: kNameKey) }
        get { UserDefaults.standard.string(forKey: kNameKey)}
    }
    var surname: String? {
        set { UserDefaults.standard.set(newValue, forKey: kSurnameKey) }
        get { UserDefaults.standard.string(forKey: kSurnameKey)}
    }
}
