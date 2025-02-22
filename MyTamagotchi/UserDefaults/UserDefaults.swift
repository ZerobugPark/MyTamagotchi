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
        case isSave, character
    }
    
    @TamagotchiManager(key: Key.isSave.rawValue, empty: false)
    static var isSave
    
    @TamagotchiManager(key: Key.character.rawValue, empty: 0)
    static var character
    
}
