//
//  ExploreView.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/07.
//

import SwiftUI

struct ExploreView: View {
    
    //isProfile의 default는 "탐색"
    @State private var isProfile: String = Submenu.Explore.rawValue
    @State private var searchData: String = ""
    
    @EnvironmentObject var router: TabRouter
    
    var body: some View {
        VStack{
            
            SearchFieldView(searchData: $searchData)
                .padding(.horizontal)
            
            PickerView(isProfile: $isProfile)
            
            ResultView(searchData: $searchData, isProfile: $isProfile)
        }
    }
    
}
 //PickerView에서 선택할 두 옵션들을 열거형으로 선언
enum Submenu: String {
    case Explore = "탐색"
    case Profile = "프로필"
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(TabRouter())
    }
}
