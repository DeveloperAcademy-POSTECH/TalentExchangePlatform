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
                            Image("\(user)")
                                .resizable()
                                .background( Color("color_bg").opacity(0.1))
                                .frame(width: 60, height: 60)
                                .overlay(Circle().stroke(Color("color_primary"), lineWidth: 5))
                                .clipShape(Circle())
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
