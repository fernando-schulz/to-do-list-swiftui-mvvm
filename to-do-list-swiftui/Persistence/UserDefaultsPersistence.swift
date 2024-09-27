//
//  UserDefaultsPersistence.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 21/09/24.
//

import Foundation

protocol Persistence {
    func saveData(data: Data, forKey key: String)
    func loadData(forKey key: String) -> Data?
    func loadId(forKey key: String) -> Int?
    func saveId(id: Int, forKey key: String)
}

class UserDefaultsPersistence: Persistence {
    func saveData(data: Data, forKey key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadData(forKey key: String) -> Data? {
        UserDefaults.standard.data(forKey: key)
    }
    
    func loadId(forKey key: String) -> Int? {
        UserDefaults.standard.integer(forKey: key)
    }
    
    func saveId(id: Int, forKey key: String) {
        UserDefaults.standard.set(id, forKey: key)
    }
}
