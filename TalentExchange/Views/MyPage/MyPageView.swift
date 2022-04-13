//
//  MyPageView.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/07.
//

import SwiftUI

struct MyPageView: View {
    
    @EnvironmentObject var router: TabRouter
    @State var show = false
    @Namespace var namespace
    
    let stop1 = Gradient.Stop(color: .black, location: 0.25)
    let stop2 = Gradient.Stop(color: .white, location: 1.0)
    
    var body: some View {
        
        ZStack{
            if show == false {
                ZStack {
                    VStack(spacing: 20){
                        
                        Text("Profile")
                            .font(.largeTitle).bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .padding(.top, 45)
                        
                        ScrollView(showsIndicators: false) {
                            
                            // Card
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
                                .matchedGeometryEffect(id: "title", in: namespace)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("애셔 입니다!! 다 잘합니다. 창원에 살구요.")
                                    .font(.caption).foregroundColor(.white)
                                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                                    .matchedGeometryEffect(id: "bio", in: namespace)
                                
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
                            .frame(height: 450)
//                            .padding(.all, 30)
                            .padding(EdgeInsets(top: 40, leading: 30, bottom: 30, trailing: 60))
                            // .frame(maxWidth: .infinity, maxHeight: 800)
                            .frame(maxWidth: .infinity)
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
                            .mask(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .matchedGeometryEffect(id: "shape", in: namespace)
                            )
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
                            
                            Image("my2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(.top, 10)

                            Image("my3")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(.top, 10)
                            
                            
                            // Card2
                        }// Scroll view
                        .ignoresSafeArea()
//                        .frame(width: .infinity, height: 900, alignment: .bottom)
                    }
                    .padding(EdgeInsets(top: 43, leading: 24, bottom: 24, trailing: 24))
                    .background(
                        LinearGradient(
                            gradient: Gradient(stops: [stop1, stop2]),
                            startPoint: .top, endPoint: .bottom)
                    )
                } // zstck - inner
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }else {
                MyDetailView(namespace: namespace)
            } // if-else
        }// zstck - outter
        .ignoresSafeArea()
//        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .animation(.spring(), value: show)
        .onTapGesture {
            show.toggle()
        }//zstack
        
        
    }// body
}//view

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
            .environmentObject(TabRouter())
    }
}
