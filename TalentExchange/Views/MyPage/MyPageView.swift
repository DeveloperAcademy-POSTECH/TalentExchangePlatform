//
//  MyPageView.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/07.
//

import SwiftUI

struct MyPageView: View {
    
    @EnvironmentObject var router: TabRouter
    let stop1 = Gradient.Stop(color: .black, location: 0.25)
    let stop2 = Gradient.Stop(color: .white, location: 1.0)
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 20){
                Text("Profile")
                    .font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                
                
                //start of card
                
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
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("애셔 입니다!! 다 잘합니다. 창원에 살구요.")
                        .font(.caption).foregroundColor(.white)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                    
                    
                    Text("👀 관심있어요")
                        .font(.subheadline).bold().foregroundColor(.white)
                        .padding(EdgeInsets(top: 25, leading: 5, bottom: 0, trailing: 0))
                    
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
                    
                    Text("👍 할줄알아요")
                        .font(.subheadline).bold().foregroundColor(.white)
                        .padding(EdgeInsets(top: 40, leading: 5, bottom: 0, trailing: 0))
                    
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
                    
                    Spacer()
                    
                }
                .padding(.all, 30)
                .frame(maxWidth: .infinity, maxHeight: 450)
                //            .background(Color.blue)
                .background(
                    
                    Image("my1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(
                            Color.black
                                .opacity(0.4)
                        )
                )
                //            .cornerRadius(30)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                
                //end of card
                Spacer()
                
                
                
            }
            .padding(20)
            .background(
                    LinearGradient(
//                        gradient: Gradient(colors: [.black, .white]),
                        gradient: Gradient(stops: [stop1, stop2]),
                        startPoint: .top, endPoint: .bottom)
                )
        } // zstck
        
    }// body
}//view

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
            .environmentObject(TabRouter())
    }
}
