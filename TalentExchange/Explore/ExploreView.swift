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
    
    /*
    init(isProfile: String, searchData: String) {
        self.isProfile = Submenu.Profile.rawValue
        self.searchData = ""
    }
    */
    
    @EnvironmentObject var router: TabRouter
    
    let users = ["asher", "august", "avery", "grizzly", "ground", "jay", "jun", "may", "sohni"]
    let bicycleImageList = ["bicycle1", "bicycle2", "bicycle3", "bicycle4"]
    let bookImageList = ["book1", "book2", "book3", "book4"]
    let cookingImageList = ["cooking1", "cooking2", "cookin3", "cooking4"]
    let danceImageList = ["dance1", "dance2", "dance3", "dance4"]
    let festivalImageList = ["festival1", "festival2", "festival3", "festival4"]
    let gameImageList = ["game1", "game2", "game3", "game4"]
    let travelImageList = ["travel1", "travel2", "travel3", "travel4"]
    
    let backgrounds = [
        ["user":"Asher", "talent1":"bicycle", "talent2":"cooking", "talent3":"dance"],
        ["user":"Asher1", "talent1":"bicycle", "talent2":"book", "talent3":"game"],
        ["user":"Asher2", "talent1":"dance", "talent2":"game", "talent3":"travel"],
        ["user":"Ashering", "talent1":"book", "talent2":"game", "talent3":"travel"],
        ["user":"Ashered", "talent1":"cooking", "talent2":"festival", "talent3":"game"],
        ["user":"Sohni", "talent1":"book", "talent2":"festival", "talent3":"travel"],
        ["user":"Sonny", "talent1":"cooking", "talent2":"game", "talent3":"travel"]
     ]
    
    var body: some View {
        VStack{
            
            SearchFieldView(searchData: $searchData)
            
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
