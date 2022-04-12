//
//  DetailPage.swift
//  TalentExchange
//
//  Created by Jay Jung on 2022/04/11.
//

import SwiftUI

let personality = ["사진장인", "애니 30편", "칭찬셔틀"]
let textbody = ["대학에서 수묵화를 부전공했습니다.\n현재는 제품 디자이너로 종사하고 있고 입시 미술 학원에서 2년 정도 수묵화를 가르친 경험이 있습니다.\n동양화나 서양화, 유화 등 주말에 한 번씩 만나서 같이 그림 그리실 분 구해요~!"]

struct DetailPage: View {
    
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
                            .padding(.horizontal, 20.0)
                            .background(.gray)
                            .clipShape(Capsule())
                                            
                            Text("강의 2년")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.caption)
                                .padding(.vertical, 7.0)
                                .padding(.horizontal, 20.0)
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
                            .foregroundColor(.white)
                            .font(.caption)
                            .padding(.vertical, 7.0)
                            .padding(.horizontal, 15.0)
                            .background(Color("color_primary"))
                            .clipShape(Capsule())
                        Text("애니30편")
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
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet consectetur adipiscing elit. Nam libero justo laoreet sit amet cursus sit amet dictum. Egestas tellus rutrum tellus pellentesque eu tincidunt tortor. Amet justo donec enim diam  ")
    //                            .frame(height: 500)
                                .padding()
                                }
                            }
                    //Scroll View
                    Spacer()
                    HStack(){
                            Spacer()
                            Text("대화 시작")
                        // 둥그런 사각형 버튼을 여기에 넣어주세요
                    }
                       
                    }//VStack
                }// ZStack
                .edgesIgnoringSafeArea(.all)
        }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage()
            .environmentObject(TabRouter())
        }
}
