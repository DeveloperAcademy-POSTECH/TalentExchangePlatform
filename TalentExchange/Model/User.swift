//
//  User.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/11.
//

import Foundation
import SwiftUI

struct User: Hashable, Codable, Identifiable {
    
    var id: Int
    var username: String
    var password: String
    
    var talents: Array<String>
    var interests: Array<String>
    var city: String
    var bio: String

    //private 제거했음
    var userimage: String
    var image: Image {
        Image(userimage)
    }
    
    /*
    init(id: Int, username: String, password: String,
         talents: Array<String>, interests: Array<String>, city: String, bio: String, userimage: String) {
        self.id = id
        self.username = username
        self.password = password
        self.talents = talents
        self.interests = interests
        self.city = city
        self.bio = bio
        self.userimage = userimage
    }
     */
}
