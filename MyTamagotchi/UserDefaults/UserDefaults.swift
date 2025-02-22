//
//  UserDefaults.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/22/25.
//

import Foundation




@propertyWrapper struct TamagotchiManager<T> {
    
    let key: String
    let empty: T
    
    
    var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? empty
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: key)
        }
    }
}


enum UserDefaultManager {
    enum Key: String {
        case isSave, character, characterInfo, characterName
    }
    
    @TamagotchiManager(key: Key.isSave.rawValue, empty: false)
    static var isSave
    
    @TamagotchiManager(key: Key.character.rawValue, empty: 0)
    static var character
    
    @TamagotchiManager(key: Key.characterInfo.rawValue, empty: [[0,0]])
    static var characterInfo
    
    @TamagotchiManager(key: Key.characterName.rawValue, empty: ["대장"])
    static var characterName
    
}
