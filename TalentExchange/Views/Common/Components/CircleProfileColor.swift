//
//  CircleProfileColor.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/08.
//

import SwiftUI

struct CircleProfileColor: View {
    var userImage: String = ""
    
    var body: some View {
        
        Image(userImage)
            .resizable()
            .background( Color("color_bg").opacity(0.1))
            .frame(width: 60, height: 60)
            .overlay(Circle().stroke(Color("color_primary"), lineWidth: 5))
            .clipShape(Circle())
    }
}
