//
//  ChatView.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/07.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var router: TabRouter
    @State var searchText: String = ""
    
    let users = ["avery", "ground", "grizzly", "jay", "sony"]
    let messages = [
        ["user":"avery", "message":"애셔, 깊은관계 논쟁에 대해 어떻게 생각하세요?", "time": "10:30 AM"],
        ["user":"ground", "message": "오늘은 23시부터 잔업하니까 늦지마세요 애셔", "time": "12:45 AM"],
        ["user":"grizzly", "message": "샹크스 죽나요?", "time": "12:15 PM"],
        ["user":"jay", "message": "오늘 스쿼트 하셨어요?", "time": "4:30 AM"],
        ["user":"sony", "message": "스테이크 좋아합니다.", "time": "8:17 AM"]]
    
    
    var body: some View {
        ZStack{
            Color("color_bg").edgesIgnoringSafeArea(.all)
            VStack{
                
                HStack{
                    Text("Chat")
                        .fontWeight(.semibold)
                        .font(.largeTitle)
                    Spacer()
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(Color("color_primary"))
                        .font(.title2)
                }
                
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading, spacing: 5){
                        
                        SearchView(searchText: $searchText)
                        
                        OnlineUsersView(users: users)
                       
                        Divider()
                            .padding(.bottom, 20)
                        
                        VStack(spacing: 25){
                        ForEach(messages, id: \.self) { message in
         
                            ChatItem(
                                userImage: String(describing: message["user"]!),
                                userName: String(describing: message["user"]!),
                                message: String(describing: message["message"]!),
                                time: String(describing: message["time"]!)
                            )
                            
                            }
                        }
                       
                    }
                }
            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(TabRouter())
    }
}
