//
//  LikeHeart.swift
//  TalentExchange
//
//  Created by Heeji Sohn on 2022/04/12.
//

import SwiftUI

struct LikeHeart: View {
    @State private var animate = false
    @State private var likeAnimation = false
    @State private var isLiked = false
    @State private var offset = false
    private let duration: Double = 0.2
    private var animationScale: CGFloat{
        isLiked ? 0.6:2.0
    }
    
/*    func performanAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)){
            likeAnimation=false
        }
  
    }
 */
    
    var body: some View {
        
        Button(action:{
  //          withAnimation(Animation.default.delay(1.0)) {
    //                                animate.toggle()
    //                            }
            self.animate = true
            DispatchQueue.main.asyncAfter(deadline: .now()/*+self.duration*/, execute:{
                self.animate=false
                self.isLiked.toggle()
            })
        }){
            Image(systemName: isLiked ? "heart.fill": "heart")
                .foregroundColor(.red)
        }
        .font(.title)
        .padding([.top, .trailing], 20)
    //    .scaleEffect(animate ? animationScale: 1)
    //    .animation(.easeIn(duration: duration), value: offset)
  //      .animation(.easeIn(duration: duration))
        
        
        
  
    }
}

struct LikeHeart_Previews: PreviewProvider {
    static var previews: some View {
        LikeHeart()
    }
}
