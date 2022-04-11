//
//  ExploreRow.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/11.
//

import SwiftUI

struct ExploreRow: View {
    @EnvironmentObject var modelData: ModelData
    
    var user: User
    
    var body: some View {
        HStack{
            user.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(user.username)
            
            Spacer()
        }
    }
    
}

struct ExploreRow_Previews: PreviewProvider {
    
    static var users = ModelData().users
    
    static var previews: some View {
        Group{
            ExploreRow(user: users[1])
            ExploreRow(user: users[2])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
