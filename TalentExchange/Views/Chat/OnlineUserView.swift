//
//  OnlineUserView.swift
//  TalentExchange
//
//  Created by 임영후 on 2022/04/07.
//

import SwiftUI

struct OnlineUsersView: View {
    
    var users = [String]()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:25){
                    ForEach(users, id: \.self) { user in
                        VStack{
//                            Image("\(user)")
                            CircleProfileColor(userImage: user)
                            
                            Text("\(user)")
                                .fontWeight(.semibold)
                                .padding(.top, 3)
                        }
                    }
                }
            .padding(.vertical, 20)
        }
    }
}
