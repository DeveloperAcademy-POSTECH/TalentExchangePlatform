//
//  MyDetailView.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/12.
//

import SwiftUI

struct Talents {
    static let imageNames = [
        "avery",
        "grizzly",
        "ground",
        "jay",
        "avery",
        "grizzly",
        "ground",
        "jay",
        "avery",
        "grizzly",
        "ground",
        "jay",
    ]
}

struct MyDetailView: View {
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    @State var appear = false
    var namespace: Namespace.ID
    
    let stop1 = Gradient.Stop(color: .black, location: 0)
    let stop2 = Gradient.Stop(color: .white, location: 0)
  
    var body: some View {
        
        
        ScrollView(showsIndicators: false){
            
            
            VStack{

                /** USER PROFILE CARD **/
                VStack(spacing: 20){
                    
                    //CARD
                    VStack(alignment: .leading){
                        HStack{
                            Image("asher")
                                .resizable()
                                .background( Color("color_bg_inverted").opacity(0.5))
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                            
                            Text("Asher").bold()
                                .foregroundColor(.white)
                            
                            
                        }
                        .padding(.top, 50)
                        .matchedGeometryEffect(id: "title", in: namespace)
                        
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // BIO
                        Text("애셔 입니다!! 다 잘합니다. 창원에 살구요.")
                            .font(.caption).foregroundColor(.white)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                            .matchedGeometryEffect(id: "bio", in: namespace)
                        
                        // INTERESTS
                        Text("👀 관심있어요")
                            .font(.subheadline).bold().foregroundColor(.white)
                            .padding(EdgeInsets(top: 25, leading: 5, bottom: 0, trailing: 0))
                            .matchedGeometryEffect(id: "interest", in: namespace)
                        
                        HStack{
                            Spacer()
                                .frame(width: 20.0, height: 0.0)
                            
                            Text("사진장인")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.caption)
                                .padding(.vertical, 7.0)
                                .padding(.horizontal, 15.0)
                                .background(Color("color_primary"))
                                .clipShape(Capsule())
                            
                            Text("칭찬셔틀")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.caption)
                                .padding(.vertical, 7.0)
                                .padding(.horizontal, 15.0)
                                .background(Color("color_primary"))
                                .clipShape(Capsule())
                        }
                        .matchedGeometryEffect(id: "interests", in: namespace)
                        
                        // TALENTS
                        Text("👍 할줄알아요")
                            .font(.subheadline).bold().foregroundColor(.white)
                            .padding(EdgeInsets(top: 25, leading: 5, bottom: 0, trailing: 0))
                            .matchedGeometryEffect(id: "talent", in: namespace)
                        
                        HStack{
                            Spacer()
                                .frame(width: 20.0, height: 0.0)
                            
                            Text("사진장인")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.caption)
                                .padding(.vertical, 7.0)
                                .padding(.horizontal, 15.0)
                                .background(Color("color_primary"))
                                .clipShape(Capsule())
                            
                            Text("칭찬셔틀")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.caption)
                                .padding(.vertical, 7.0)
                                .padding(.horizontal, 15.0)
                                .background(Color("color_primary"))
                                .clipShape(Capsule())
                        }
                        .matchedGeometryEffect(id: "talents", in: namespace)
                        
                        Spacer()
                        
                    }
                    .padding(.all, 30)
                    .frame(maxWidth: .infinity, maxHeight: 800)
                    //            .background(Color.blue)
                    .background(
                        Image("my1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .overlay(
                                Color.black
                                    .opacity(0.4)
                            )
                            .matchedGeometryEffect(id: "image", in: namespace)
                    )
                    //            .cornerRadius(30)
                    .mask(
                        RoundedRectangle(cornerRadius: 0, style: .continuous)
                            .matchedGeometryEffect(id: "shape", in: namespace)
                    )
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
                    
                    
                    Spacer()
                    

                        .padding(EdgeInsets(top: -20, leading: 0, bottom: 0, trailing: 0))
                    //smooooth
                        .offset(y: appear ? 0 : 100)
                        .onAppear{
                            appear = true
                        }
                        .onDisappear{
                            appear = false
                        }
                    //                    .transition(.move(edge: .bottom))
                    
                }
                /** USER PROFILE CARD **/
                
//                Text("Talent-Card Board")
//                    .padding(.top, 30)
//
                /** DETAILS **/
                VStack{
                    
                    LazyVGrid(columns: columns){
                        ForEach(Talents.imageNames.indices) { index in
                            VStack(alignment: .trailing) {
                                Image(Talents.imageNames[index])
                                    .resizable()
                                    .background(Color.grayF4)
                                    .frame(width: (UIScreen.main.bounds.width-48)/3, height: (UIScreen.main.bounds.width-60)/3)
                                    .cornerRadius(12)
                                Spacer().frame(width: 20 , height: 10)
                                
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 40, trailing: 0))
                    .frame(width: (UIScreen.main.bounds.width-48))
                    .matchedGeometryEffect(id: "post", in: namespace)
                    // BOTTOM CONTENTS
                    
                    Button("add my cards") {
                        // 나의 취미 추가하기
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 100, trailing: 0))
                    
                    
                    Spacer()
                }
                
                /** DETAILS **/
                
                Spacer()
            }
            
            //Scroll View frame 속성 : 어딜눌러도 스크롤
            .frame(maxWidth: .infinity)
            
        }
        .background(
            LinearGradient(
                //                        gradient: Gradient(colors: [.black, .white]),
                gradient: Gradient(stops: [stop1, stop2]),
                startPoint: .top, endPoint: .bottom)
        )
        .ignoresSafeArea()
        
        
    }// body
}

struct MyDetailView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        MyDetailView(namespace: namespace)
    }
}
