//
//  Chatitem.swift
//  TalentExchange
//
//  Created by 임영후 on 2022/04/07.
//

import SwiftUI

struct ChatItem: View {
    
    var userImage: String = ""
    var userName: String = ""
    var message: String = ""
    var time: String = ""
    
    var body: some View {
        HStack{
            CircleProfile(userImage: userImage)
        
            VStack(alignment: .leading, spacing: 8){
                HStack{
                    Text(userName)
                        .fontWeight(.semibold)
                        .padding(.top, 3)
                    Spacer()
                    Text(time)
                        .foregroundColor(Color("color_primary"))
                        .padding(.top, 3)
                }
                
                
                Text(message)
                    .foregroundColor(Color("color_bg_inverted").opacity(0.5))
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                Divider()
                    .padding(.top, 8)
            }
            .padding(.horizontal, 10)
        }
    }
}
