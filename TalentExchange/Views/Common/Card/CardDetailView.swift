//
//  DetailPage.swift
//  TalentExchange
//
//  Created by Jay Jung on 2022/04/11.
//

import SwiftUI



struct CardDetailView: View {
    
    @EnvironmentObject var router: TabRouter
    
    var body: some View {
        ZStack{
            Color("color_bg")
            VStack{
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading, spacing: 5){
                        Image("image1")
                        HStack(spacing: 10){
                            Text("수묵화 그리기").font(.system(size: 25, weight: .semibold))
                                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 30))
                            
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color(.red))
                                .font(.title2)
                                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                            
                            Spacer()
                        }
                        HStack{
                            Text("취미 10년")
                                .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.caption)
                            .padding(.vertical, 7.0)
                            .padding(.horizontal, 15.0)
                            .background(.gray)
                            .clipShape(Capsule())
                                            
                            Text("강의 2년")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.caption)
                                .padding(.vertical, 7.0)
                                .padding(.horizontal, 19.0)
                                .background(.gray)
                                .clipShape(Capsule())
                            Spacer()
                        }.padding(EdgeInsets(top: 7, leading: 20, bottom: 7, trailing: 20))
                        HStack{
                        Image(decorative: "sony")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                        Text("Sony")
                            .fontWeight(.semibold)
                        Text("사진장인")
                            .fontWeight(.bold)
                            .foregroundColor(Color("color_variation_2"))
                            .font(.caption)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(Color("color_variation_1"))
                            .clipShape(Capsule())
                        Text("애니30편")
                            .fontWeight(.bold)
                            .foregroundColor(Color("color_variation_4"))
                            .font(.caption)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(Color("color_variation_3"))
                            .clipShape(Capsule())
                        Text("칭찬셔틀")
                                    .fontWeight(.bold)
                                .foregroundColor(Color("color_secondary"))
                                .font(.caption)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .background(Color("color_primary"))
                                .clipShape(Capsule())
                        
                            }
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet consectetur adipiscing elit. Nam libero justo laoreet sit amet cursus sit amet dictum. Egestas tellus rutrum tellus pellentesque eu tincidunt tortor. Amet justo donec enim diamLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet consectetur adipiscing elit. Nam libero justo laoreet sit amet cursus sit amet dictum. Egestas tellus rutrum tellus pellentesque eu tincidunt tortor. Amet justo donec enim diam  ")
                                .padding()
                                }
                            }
                    //Scroll View
                    Spacer()
                    HStack(){
                            Spacer()
                        Button("채팅 시작")
                            {
                            ///*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ here
                        }
                        .padding(EdgeInsets(top: 7, leading:20, bottom: 7, trailing: 20))
                        .background(Color("color_tertiary"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        
                        
                    }.padding()
                       
                    }//VStack
                }// ZStack
                .edgesIgnoringSafeArea(.all)
        }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView()
            .environmentObject(TabRouter())
        }
}
