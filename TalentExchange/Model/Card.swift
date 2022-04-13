//
//  Talent.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/11.
//

import SwiftUI

struct Card: Hashable, Codable, Identifiable {
    
    var id: Int
    var cardName: String
    var uid: Int
    var username: String
    var talents: String
    var contents: String
    var timestamp: String

    private var cardImage: String
    var image: Image {
        Image(cardImage)
    }
}

