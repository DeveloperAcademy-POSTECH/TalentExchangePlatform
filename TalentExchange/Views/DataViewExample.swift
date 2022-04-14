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
    var card: Card
    
    var body: some View {
        HStack{
            user.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(user.username)
            Spacer()
            
            /* photo view 따로 파야할듯 여기서 uid 를 넘겨주기 */
            /* 그럼 cardView 에서 불러오기 for each..? */
            card.image
                .resizable()
                .frame(width: 50, height: 50)
            
        }
    }
}

struct ExploreRow_Previews: PreviewProvider {
    
    static var users = ModelData().users //user : [ [user1],[user2],[user3],[user4] ]
    static var cards = ModelData().cards //cards : [ [card1],[card2],[card3],[card4] ]
    
    static var previews: some View {
        Group{
            ExploreRow(user: users[1], card: cards[1]) //user2
            ExploreRow(user: users[2], card: cards[2]) //user3
            // 한 사용자에 여러개의 카드가 있다면 어떻게 불러올 것인가...?
            // 1. 사용자 아이디 획득
            // 2. 사용자 id에 맞는 사진 넣는 곳
            // 3. 불러오기
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
