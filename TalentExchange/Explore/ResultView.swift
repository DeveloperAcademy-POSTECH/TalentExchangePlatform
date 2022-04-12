//
//  ResultView.swift
//  TalentExchange
//
//  Created by KimJS on 2022/04/11.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var searchData: String
    @Binding var isProfile: String
    
    @EnvironmentObject var modelData: ModelData
    
    var uuser: [User] = ModelData().users
    var ccard: [Card] = ModelData().cards
    
    //만일 searchData가 bicycle일 경우
    let bicycle = ["bicycle1", "bicycle2", "bicycle3", "bicycle4"]
    let book = ["book1", "book2", "book3", "book4"]
    let cooking = ["cooking1", "cooking2", "cookin3", "cooking4"]
    let talents = ["bicycle", "book", "cooking"]
    
    var body: some View {
        if(isProfile == Submenu.Explore.rawValue) {
            //talents 배열 내에 없는 관심사를 입력하였다면,
            if(!talents.contains(searchData)){
            ScrollView(.vertical, showsIndicators: false) {
                HStack{
                    ForEach(0..<2, id: \.self) {column in
                        VStack{
                            ForEach(bicycle, id: \.self) {row in
                                Image(row)
                                    .resizable()
                                    .background(Color("color_bg_inverted").opacity(0.05))
                                    .frame(width:180, height:180)
                                
                            }
                        }
                    }
                }
             }//ScrollView end.
            }//if end.
            //talents 배열 내에 있는 관심사를 입력하였다면,
            else{
                
            }
        }//if end.
        else {//프로필 선택
            /*
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(searchResults, id: \.self) { result in
                    ResultProfileView(userName:result, userImage:result)
                    }
            ResultProfileView(userName:searchData, userImage:searchData)
             */
            var searchID: Int = getid(it: uuser, name: searchData) // grizzly => id:3
            var searchUID: [Int] = getuid(it: ccard, number: searchID) // uid:3 => id: 5, 6, 7, 8
            NavigationView{
                List((ExploreView().users).filter({"\($0)".contains(searchData) || searchData.isEmpty}), id : \.self){ i in
                    NavigationLink(destination:Text(i)) {
                    ResultProfileView(numberid:searchUID,numberuid:searchID)
                    }
                }
            }
        } 
    }
} //struct ResultView end.

func getid(it: [User], name: String) -> Int {
    var result: Int = 0
    
    for index in 0..<it.count {
        if(it[index].username == name) {
            result = it[index].id
        }
    }
    return result
}

func getuid(it: [Card], number: Int) -> [Int] {
    var result: [Int] = []
    
    for index in 0..<it.count {
        if(it[index].uid == number) {
            result.append(it[index].id)
        }
    }
    
    return result
}
        
            
            
            /*
                NavigationView {
                    List {
                        ForEach(searchResults, id: \.self) { result in
                            NavigationLink(destination: Text(result)) {
                                ResultProfileView(userName:result)
                            }
                        }// ForEach end.
                    } // List end.
                    .searchable(text: $searchData)
                    //.navigationBarTitle("프로필검색창")
                    .padding()
                    .background(.white)
                } // NavigationView end.
        }
    }
    
    var searchResults: [String] {
        if searchData.isEmpty {
            return ExploreView().users
        } else {
            return ExploreView().users.filter { $0.contains(searchData) }
        }
    }
*/
/*
 talents.filer {$0.contains(searchData)}
    var body: some View {
        //사용자가 Picker에서 "탐색"을 선택할 경우
        if (isProfile == Submenu.Explore.rawValue) {
            ResultDetailExplore(searchData:$searchData)
            //기본적으로는 ScrollView인데,
            
            //Navigation 필요
            /*
             NavigationView {
             ExploreDetailView()
             
             } label: {
             //보여주고 싶은 프로필 결과창들 쭈루룩... 스크롤로 내릴 수 있게
             ScrollView{
             
             .padding()
             }
             }
             .navigationTitle("프로필결과창")
             */
        }
        //사용자가 Picker에서 "프로필"을 선택할 경우
        else {
            ResultDetailProfile(searchData:$searchData)
            NavigationView {
                List {
                    Text("리스트 내의 text")
                    
                    ForEach(searchResults, id: \.self) { result in
                        NavigationLink(destination: Text(result)) {
                            ResultProfileView(userName:result)
                        }
                    }// ForEach end.
                } // List end.
                .searchable(text: $searchData)
                .navigationBarTitle("프로필검색창")
                .padding()
            } // NavigationView end.
            
            
        }
    }
    
    
    var searchResults: [String] {
        if searchData.isEmpty {
            return ExploreView().users
        } else {
            return ExploreView().users.filter { $0.contains(searchData) }
        }
    }
    
}
 */


/*
NavigationView{
    List((ExploreView().users).filter({"\($0)".contains(searchData) || searchData.isEmpty}), id : \.self){ i in
        
        ResultProfileView(userName:i,userImage:i)
    }
}
*/
