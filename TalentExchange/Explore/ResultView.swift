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
            
            var searchImage: [Image] = getimageexplore(it: ccard, talent: searchData)
            //[이미지파일명, 이미지파일명, 이미지파일명]
            
            let columns = [
                //추가 하면 할수록 화면에 보여지는 개수가 변함
                GridItem(.flexible()),
                GridItem(.flexible()),
//                GridItem(.flexible())
            ]
            //사용자가 아무런 입력을 하지 않았을 때의 화면
            if(searchData == ""){
                var randomccard: [Card] = ccard.shuffled()
                
                VStack{
//                    Text("탐색 검색어 목록")
                    
                    HStack(){
                        Text("거리순")
                                .fontWeight(.bold)
                                .frame(width: 60)
                                .foregroundColor(.white)
                                .font(.caption)
                                .padding(.vertical, 8.0)
                                .padding(.horizontal, 10.0)
                                .background(Color("color_primary"))
                                .clipShape(Capsule())
                        Text("관련도순")
                                .fontWeight(.bold)
                                .frame(width: 60)
                                .foregroundColor(Color("color_primary"))
                                .font(.caption)
                                .padding(.vertical, 8.0)
                                .padding(.horizontal, 10.0)
                                .background(Color.grayF4)
                                .clipShape(Capsule())
                        Text("인기많은순")
                                .fontWeight(.bold)
                                .frame(width: 60)
                                .foregroundColor(Color("color_primary"))
                                .font(.caption)
                                .padding(.vertical, 8.0)
                                .padding(.horizontal, 10.0)
                                .background(Color.grayF4)
                                .clipShape(Capsule())
                    }//HStack end.
                    
                    
                    /* 탐색검색서
                    ScrollView (.horizontal, showsIndicators: false) {
                             HStack(alignment:.top){
                                 ForEach(0..<ccard.count, id:\.self) { s in
//                                     Capsule()
//                                         .fill(Color.purple)
//                                         .frame(width:80, height:30)
//                                         .overlay(Text("\(ccard[s].talents)"))
                                     Text("\(ccard[s].talents)")
                                             .fontWeight(.bold)
                                             .foregroundColor(.white)
                                             .font(.caption)
                                             .padding(.vertical, 7.0)
                                             .padding(.horizontal, 10.0)
                                             .background(Color("color_primary"))
                                             .clipShape(Capsule())
                                 }//ForEach end.
                                 .padding(.vertical)
                             }//HStack end.
                         }//ScrollView end.
                     */

                    
//                    Text("랜덤으로 탐색")
//                        .frame(alignment:.center)
//                        .padding(10)
//                        .offset(y:-10)
//                    NavigationView{
                        ScrollView(.vertical, showsIndicators:false) {
                            LazyVGrid(columns: columns,
                                      alignment: .center,
                                      spacing: 5,
                                      content: {
                                ForEach(0..<ccard.count, id:\.self) { s in
                                    NavigationLink(destination:Text("This is random image")) {
                                        randomccard[s].image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width:180,height:180)
                                            .cornerRadius(10)
                                            .clipped()
                                    }//NavigationLink end.
                                }//ForEach end.
                            })//LazyVGrid end.
                        }//ScrollView end.
//                        .offset(y:-100)
//                    }//NavigationView end.
                }//VStack end.
                .padding(5)
                
            }//if(값이 없을 경우) end.
            //이제부터는 사용자가 값을 입력했을 경우(취미,관심사)
            else {
                NavigationView{
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns,
                                  alignment: .center,
                                  spacing: 6,
                                  content: {
                            ForEach(0..<searchImage.count, id:\.self) { s in NavigationLink(destination: Text("yes i can do")) {
                                searchImage[s]
                                    .resizable()
                                    .cornerRadius(10)
                                    .frame(height:180)
                                    .padding(15)
                                
//                                searchImage[s]
//                                    .resizable()
//                                    .frame(width: (UIScreen.main.bounds.width-48)/3, height: (UIScreen.main.bounds.width-60)/3)
//                                    .cornerRadius(12)
//                                Spacer().frame(width: 20 , height: 10)
                                
                                } // NavigationLink end.
                            } // ForEach end.
                        }) // LazyVGrid end.
                    } // ScrollView end.
                    .offset(y:-100)
                }// NavigationView end.
            } //else(값이 존재할 경우) end.
        }//if(탐색) end.
        
        //유저가 프로필 선택
        else {
            var searchID: Int = getid(it: uuser, name: searchData) // grizzly => id:3
            var searchUID: [Int] = getuid(it: ccard, number: searchID) // uid:3 => id: 5, 6, 7, 8

            
            VStack{
                
                /*
                VStack{
                    Image("search")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text("ID를 검색해주세요!")
                }
                List((getusernames(it:uuser)).filter({"\($0)".contains(searchData) && ($0 == searchData)}), id : \.self){ i in
                    NavigationLink(destination:Text(i)) {
                    ResultProfileView(numberid:searchUID,numberuid:searchID)
                    } // NavigationLink End.
                } // List end.
                */
            
                if(searchData == "") {
                                    VStack{
//                                        Image(systemName: "magnifyingglass.circle")
//                                            .resizable()
//                                            .frame(width: 100, height: 100, alignment: .center)
//                                            .padding()
                                        
                                        Spacer()
                                        
                                        VStack{
                                            Image("search_id")
                                                .resizable()
                                                .frame(width: 200, height: 200, alignment: .center)
//                                                .padding()
   
                                            Text("사용자ID를 입력해주세요")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.darkgray)
                                        }
                                        
                                        Spacer()
                                    }
                    
            } // NavigationView end.
                else{

                                   List((getusernames(it:uuser)).filter({"\($0)".contains(searchData) && ($0 == searchData)}), id : \.self){ i in
                                       
//                                       NavigationLink(destination:Text(i)) {
                                           ResultProfileView(numberid:searchUID,numberuid:searchID)
                                           //i 에는 해당 username이 들어가게 됨
//                                       } // NavigationLink End.
                                       
                                   } // List end.
                               }// else(searchData == "") end.
                           }// NavigationView end.
        
        }
    } // body some View end.
} //struct ResultView end.-

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

func getimageexplore(it: [Card], talent: String) -> [Image] {
    var result: [Image] = []
    
    for index in 0..<it.count {
        if(it[index].talents == talent) {
            result.append(it[index].image)
        } // cardImage 였었음
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

