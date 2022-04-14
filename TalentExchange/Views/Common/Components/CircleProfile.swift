//
//  CircleProfile.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/08.
//

import SwiftUI

struct CircleProfile : View {
    
    var userImage: String = ""
    
    var body: some View {
        
        Image(userImage)
            .resizable()
            .background( Color("color_bg_inverted").opacity(0.05))
            .frame(width: 80, height: 80)
            .clipShape(Circle())

    }
    
}
