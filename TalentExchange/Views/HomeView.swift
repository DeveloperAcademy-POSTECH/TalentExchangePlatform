//
//  HomeView.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/07.
//

import SwiftUI


//json 파일 오는 부분.
//우선은 사진 부분만 필요해서 사진만 가져오게 만들어둠.
//변수 이름을 photos 로 두었는데 나중에 어떻게 바뀔지에 따라서 바뀌어야 하는 부분.
struct Photos {
    static let imageNames = [
        "취미7",
        "취미9",
        "취미11",
        "취미13",
        "취미15",
        "취미16",
        "취미14",
        "취미12",
        "취미10",
        "취미8",
        "취미6",
        "취미4",
        "취미2", 
    ]
}





//BackGround 글자
struct LeadingNaviView: View{
    var body: some View{
        Text("BackGround")
            .bold()
            .frame(width: 200, height: 70)
            .font(.system(.largeTitle, design: .rounded))
            .padding(.trailing, 120)
    }
}


//위의 빨간색 원형 만드는 코드. 추후 notification 부분이 만들어지면서 바꿔질 수 있음.
struct TapGestureView: View{
    
    @State var tapped = true
    
    var tap: some Gesture{
        TapGesture(count: 1)
            .onEnded { _ in self.tapped != self.tapped}
    }
    
    var body: some View{
        Circle()
        //         .fill(self.tapped ? Color.blue : Color.red)
            .frame(width: 10, height: 10, alignment: .center)
            .foregroundColor(Color.red)
            .opacity(self.tapped ? 1.0 : 0.0)
            .padding(.top, -10)
            .padding(.trailing, -10)
            .gesture(tap)
    }
}

//알림 기능.
struct TrailingNavView: View{
    
    var body: some View{
        ZStack {
            Image(systemName: "bell.fill")
                .resizable()
                .scaledToFit()
                .badge(10)
                .padding()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(15, antialiased: true)
            TapGestureView()
        }
    }
}


//가운데 횡스크롤 뷰.
struct HomeCardView: View{
    
    var body: some View{
        VStack(alignment: .leading){
            Text("내 근처 백그라운드 ")
                .foregroundColor(Color.black)
                .font(.system(.title2, design: .rounded))
                .bold()
                .padding(.leading, 20)
             
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Photos.imageNames.indices) { index in
                        VStack(alignment: .trailing) {
                            Image(Photos.imageNames[index])
                                .resizable()
                                .frame(width: 150, height: 150, alignment: .trailing)
                                .cornerRadius(12)
                        }
                    }
                }
            }
            .padding(20)
            //listview 자리..padding(20)
        }
        .padding(.top, -100)
        .foregroundColor(Color.white)
//        .background(Color.grayF4)
//        .background(Color.white)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width, alignment: .center)
    }
}


//밑의 그리드에 관련된 뷰.
struct interestBackGround: View {
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    private var fixedLayout = [GridItem(.fixed(120)), GridItem(.fixed(100))]
    
    var body: some View {
        //into의 숫자만큼 grid개수가 정해짐
        
        VStack() {
            //제일 처음에는 글자 나오는 텍스트 필요.
            VStack(alignment: .leading){
                Text("나의 관심 백그라운드")
                    .bold()
                    .foregroundColor(Color.black)
                    .frame(width: 200, height: 50, alignment: .center)
                    .font(.system(.title2, design: .rounded))
                    
                //첫번째 부분의 1개의 사진이 큰 부분과 옆의 2부분은 따로 vstack 안에 hstack을 만들어서 구현했음.
                VStack {
                    HStack(){
                        Image(Photos.imageNames[0])
                            .resizable()
                            .cornerRadius(12)
                            .frame(width: (UIScreen.main.bounds.width-48)/3*2, height: (UIScreen.main.bounds.width-48)/3*2, alignment: .leading)
//                            .background(Color.grayF4)
                        VStack(){
                            Image(Photos.imageNames[1])
                                .resizable()
                                .frame(width: (UIScreen.main.bounds.width-48)/3, height: (UIScreen.main.bounds.width-60)/3, alignment: .leading)
//                                .background(Color.grayF4)
                                .cornerRadius(12)
                            
                            Image(Photos.imageNames[2])
                                .resizable()
                                .frame(width: (UIScreen.main.bounds.width-48)/3, height: (UIScreen.main.bounds.width-60)/3, alignment: .leading)
//                                .background(Color.grayF4)
                                .cornerRadius(12)
                        }
                    }
                    .padding(.bottom, 50)
                    
                    LazyVGrid(columns: columns){
                        ForEach(Photos.imageNames.indices) { index in
                            VStack(alignment: .trailing) {
                                if(index > 2){
                                    Image(Photos.imageNames[index])
                                        .resizable()
    //                                    .background(Color.grayF4)
                                        .frame(width: (UIScreen.main.bounds.width-48)/3, height: (UIScreen.main.bounds.width-60)/3)
                                        .cornerRadius(12)
                                    Spacer().frame(width: 20 , height: 10)
                                }

                            }
                        }
                    }
//                    .padding(.top, 50)
                    .padding(EdgeInsets(top: 150, leading:0, bottom: 150, trailing: 0))
                    .frame(width: (UIScreen.main.bounds.width-48), height: (UIScreen.main.bounds.width-60))
                }
                Spacer()
            }
        }//scrollview
        
        .padding()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width, alignment: .center)
    }
}







struct HomeView: View {
    
    @EnvironmentObject var router: TabRouter
    
    var body: some View {
        
        //제일 처음은 vstack으로 시작. 노치부분에 걸리지 않기 위해서 spacer 로 거리를 두었습니다.
        VStack(alignment: .center, spacing: 40) {
            Spacer()
            Spacer()
            Spacer()
            
            //hstack을 통해 background와 알림에 관하여 구현
            HStack(alignment: .center, spacing: 15) {
                
                LeadingNaviView()
                TrailingNavView()
                
            }
            //scrollview 시작.
            ScrollView {
                //vstack을 둔 담에 밑에 내 근처 백그라운드와 나의 관심 백그라운드 호출.
                VStack {
                    HomeCardView()
                    interestBackGround()
                }
            }.background(Color.white)
                .cornerRadius(20)
        }
        .scaledToFill()
        .padding(.top,-10)
        .foregroundColor(Color.white)
        .background(Color.black)
        
        
        /*
         Screen Router 활용예시 : explore 로 가는 버튼을 구현하는 경우
            Button {
                router.changes(to: .home)
            } label: {
                Text("Exlpore로 가기")
            }
        */
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TabRouter())
    }
}
