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
    
    var body: some View {
        //사용자가 탐색 선택, 원피스 입력했다고 가정
        if(isProfile == Submenu.Explore.rawValue) {
            
            var searchImage: [String] = getimageexplore(it: ccard, talent: searchData)
            //[이미지파일명, 이미지파일명, 이미지파일명]
            
            let columns = [
                  //추가 하면 할수록 화면에 보여지는 개수가 변함
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
            NavigationView{
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns,
                              alignment: .center,
                              spacing: 6,
                              content: {
                        ForEach(searchImage, id:\.self) { s in
                            NavigationLink(destination: Text("해당사진파일명 : \(s)")) {
                            Image(s)
                                .resizable()
                                .cornerRadius( 10)
                                .frame(height: 180)
                                .padding(5)
                            } // NavigationLink end.
                        } // ForEach end.
                    }) // LazyVGrid end.
                } // ScrollView end.
            }// NavigationView end.
        }//if(탐색) end.
        
        //유저가 프로필 선택
        else {
            
            var searchID: Int = getid(it: uuser, name: searchData) // grizzly => id:3
            var searchUID: [Int] = getuid(it: ccard, number: searchID) // uid:3 => id: 5, 6, 7, 8

            
            NavigationView{
                List((getusernames(it:uuser)).filter({"\($0)".contains(searchData) && ($0 == searchData)}), id : \.self){ i in
                    NavigationLink(destination:Text(i)) {
                    ResultProfileView(numberid:searchUID,numberuid:searchID)
                    } // NavigationLink End.
                } // List end.
            } // NavigationView end.
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

func getimageexplore(it: [Card], talent: String) -> [String] {
    var result: [String] = []
    
    for index in 0..<it.count {
        if(it[index].talents == talent) {
            result.append(it[index].cardImage)
        }
    }
    return result
}

func getusernames(it: [User]) -> [String] {
    var result: [String] = []
    
    for index in 0..<it.count {
        result.append(it[index].username)
    }
    
    return result
}
