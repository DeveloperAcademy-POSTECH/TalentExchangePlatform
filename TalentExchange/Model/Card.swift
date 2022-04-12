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

    //private 제거했음
    var cardImage: String
    var image: Image {
        Image(cardImage)
    }
    
    /*
    init(id: Int, cardName: String, uid: Int, username: String, talents: String, contents: String, timestamp: String, cardImage: String) {
        self.id = id
        self.cardName = cardName
        self.uid = uid
        self.username = username
        self.talents = talents
        self.contents = contents
        self.timestamp = timestamp
        self.cardImage = cardImage
    }
     */
}

