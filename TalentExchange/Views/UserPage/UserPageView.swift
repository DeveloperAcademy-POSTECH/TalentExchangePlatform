//
//  UserPageView.swift
//  TalentExchange
//
//  Created by Heeji Sohn on 2022/04/11.
//

import SwiftUI

struct UserPageView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var uuser:[User] = ModelData().users
    var ccard:[Card] = ModelData().cards
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    let ImageDimension = (UIScreen.main.bounds.width-40) / 3
    
    var body: some View {
        
        ZStack{
            
            //임시로 user 지정
            let thisuser=uuser[0]
            let userindex=thisuser.id
            
            ccard[userindex].image
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges:.top)
                .frame(width: 400)
            
            
            ScrollView{
                //name, info, grid
                
                VStack(alignment: .leading){
                    
                    HStack{
                        Spacer()
                            .frame(width: 0.0, height: 0.0)
                        thisuser.image
                         .resizable()
                         .frame(width: 70, height: 70)
                         .padding(.top)
                 
                        Text(thisuser.username)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.top)
                 
                        Spacer()
                        LikeHeart()
                        
                    }//userimage, username, heart
                    .padding(5)
                    
                    HStack{
                        Spacer()
                            .frame(width: 10.0, height: 0.0)
                        
                        ForEach (0..<(thisuser.talents.count)){ index in
                            Text(thisuser.talents[index])
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .padding(.vertical, 7.0)
                                .padding(.horizontal, 15.0)
                                .background(Color("color_primary"))
                                .clipShape(Capsule())
                        }
                        
                       /*
                        Text(uuser[0].talents[0])
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
                        */
                        
                    } //talent button
                    Spacer()
                        .padding(.bottom, 5.0)
                    
                    LazyVGrid(columns: columns,
                              spacing: 6,
                              pinnedViews: [.sectionHeaders]
                              
                    ){
                        
                        
                        ForEach (0..<(ccard.count)){ index in
                            if(ccard[index].uid==thisuser.id){
                                ccard[index].image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: ImageDimension, height: ImageDimension)
                                    .cornerRadius(20)
                                //     .border(Color.white)
                                    .clipped()
                            }
                            
                            
                        }
                        
                        
                        ForEach (0..<50, id: \.self){
                            index in Image("personal")
                                .resizable()
                                .scaledToFill()
                                .frame(width: ImageDimension, height: ImageDimension)
                                .cornerRadius(20)
                            //     .border(Color.white)
                                .clipped()
                            
                            
                        }
                        
                        
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





struct UserPageView_Previews: PreviewProvider {
    
    static var users:[User] = ModelData().users
    static var cards:[Card] = ModelData().cards
    
    static var previews: some View {
        Group{
            UserPageView(uuser:users,ccard:cards)
            
            
        }
        
       
    }
}
