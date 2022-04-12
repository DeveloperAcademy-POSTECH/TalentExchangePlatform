//
//  UserPageView.swift
//  TalentExchange
//
//  Created by Heeji Sohn on 2022/04/11.
//

import SwiftUI

struct UserPageView: View {
    
    
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    let ImageDimension = (UIScreen.main.bounds.width-40) / 3
    
    
    
    var body: some View {
        
        ZStack{
                Image("personal")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges:.top)
                .frame(width: 400)
            
            
            ScrollView{
                //name, info, grid
                
                VStack(alignment: .leading){
                    
                    HStack{
                        Spacer()
                        
                            .frame(width: 20.0, height: 0.0)
                        Text("Sohni")
                        
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.top)
                        Spacer()
                        LikeHeart()
                        
                    }
                    .padding(5)
                    HStack{
                        Spacer()
                            .frame(width: 20.0, height: 0.0)
                        
                        Text("사진장인")
                            .fontWeight(.bold)
                        
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(.vertical, 7.0)
                            .padding(.horizontal, 15.0)
                            .background(Color("color_primary"))
                            .clipShape(Capsule())
                        
                        Text("칭찬셔틀")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(.vertical, 7.0)
                            .padding(.horizontal, 15.0)
                        
                            .background(Color("color_primary"))
                            .clipShape(Capsule())
                        
                        
                    }
                    Spacer()
                        .padding(.bottom, 5.0)
                    //       .padding()
                    
                    LazyVGrid(columns: columns,
                              spacing: 6,
                              pinnedViews: [.sectionHeaders]
                              
                    ){
                        ForEach (0..<50, id: \.self){
                            index in Image("personal")
                            
                                .resizable()
                            //     .padding(00)
                            
                                .scaledToFill()
                                .frame(width: ImageDimension, height: ImageDimension)
                                .cornerRadius(20)
                            //     .border(Color.white)
                                .clipped()
                            
                            
                        }
                    }
                    .padding(.horizontal, 20.0)
                    
                    
                }
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 1.0, opacity: 0.90))
                .cornerRadius(40)
                .padding(.top,300)
                
                
            }
        }
        
        
    }
}




struct UserPageView_Previews: PreviewProvider {
    static var previews: some View {
        UserPageView()
    }
}
