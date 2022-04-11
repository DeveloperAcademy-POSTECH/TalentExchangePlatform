//
//  MyDetailView.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/12.
//

import SwiftUI

struct MyDetailView: View {
    
    @State var appear = false
    var namespace: Namespace.ID
    
    let stop1 = Gradient.Stop(color: .black, location: 0.1)
    let stop2 = Gradient.Stop(color: .white, location: 0.4)
    
    var body: some View {
        
            VStack(spacing: 20){
                
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
                    .padding(.top, 50)
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
                        .padding(EdgeInsets(top: 40, leading: 5, bottom: 0, trailing: 0))
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
                .frame(maxWidth: .infinity, maxHeight: 500)
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
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                ScrollView(showsIndicators: false){
                    
                    
                    
                    // BOTTOM CONTENTS
                    VStack{
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including ")
                            
                            
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including ")
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        
                        // BOTTOM CONTENTS
                        
                        Spacer()
                    }
                    
                    //Scroll View
                    .frame(maxWidth: .infinity)
    
                }
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

                
 
            }// TopView
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
