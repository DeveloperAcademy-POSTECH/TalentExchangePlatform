//
//  ExploreView.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/07.
//

import SwiftUI

struct ExploreView: View {
    
    @EnvironmentObject var router: TabRouter
    
    var body: some View {
        Text("Hello World")
        
        /*
         Screen Router 활용예시 : explore 로 가는 버튼을 구현하는 경우
            Button {
                router.changes(to: .home)
            } label: {
                Text("Home로 가기")
         테스트줄입니다_by ground
            }
        */
        
    }
    
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(TabRouter())
    }
}