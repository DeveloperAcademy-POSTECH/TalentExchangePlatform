//
//  ResultProfileView.swift
//  TalentExchange
//
//  Created by KimJS on 2022/04/11.
//

import SwiftUI
 
struct ResultProfileView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var uuser: [User] = ModelData().users
    var ccard: [Card] = ModelData().cards
    
    var numberid: [Int] // 5, 6, 7, 8
    var numberuid: Int // 3
    
    var body: some View {
        HStack {
            VStack{
                Text("\(getusername(number: numberuid))")//계정이름
                CircleProfile(userImage:getusername(number:numberuid))
                    .background(.white)
                    .frame(width: 80, height: 80)
            }
            
            //ScrollView를 활용하여 해당 계정의 사진들
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10){
                    ForEach(numberid, id: \.self){ s in
                        Image( ccard[s-1].cardImage )
                            .resizable()
                            .background( Color("color_bg_inverted").opacity(0.05))
                            .frame(width: 80, height: 80)
                        }
                }
                .padding(.leading, 10)
            }
            .frame(height: 100)
            .padding(.trailing, 10)
        }
    }
}

func getusername(number: Int) -> String {
    var result: String = ""
    
    @EnvironmentObject var modelData: ModelData
    
    var uuuser: [User] = ModelData().users
    if(number != 0){
        result = uuuser[number-1].username
    }
    return result
}
