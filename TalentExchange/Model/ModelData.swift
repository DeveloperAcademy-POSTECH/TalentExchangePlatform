//
//  ModelData.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/10.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var users: [User] = load("userData.json")
    @Published var cards: [Card] = load("cardData.json")
}

var users: [User] = load("userData.json")
var cards: [Card] = load("cardData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
