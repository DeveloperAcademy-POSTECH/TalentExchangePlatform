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

    private var userimage: String
    var image: Image {
        Image(userimage)
    }
}
