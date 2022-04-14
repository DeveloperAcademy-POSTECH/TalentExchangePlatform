//
//  SearchFieldView.swift
//  TalentExchange
//
//  Created by KimJS on 2022/04/11.
//

import SwiftUI

struct SearchFieldView: View {
    
    //통상 검색결과 변수명은 searchText로 하는 것 같은데, 혹시 Chat에서의 검색결과와 혼용될까봐 다른 변수명인 searchData로 명명했음
    @Binding var searchData: String
    
    var body: some View {
        VStack{
            HStack {
                    
                TextField("탐색하거나 프로필 검색하세요", text: $searchData)
                        .foregroundColor(.primary)
                        .textInputAutocapitalization(.never)
                    
                Button(action: {
                    self.searchData = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(searchData == "" ? 0 : 1)
                }
            }
            .padding(15)
            .foregroundColor(.secondary)
            .background(Color("color_bg_inverted").opacity(0.05))
            .clipShape(Capsule())
        }
        .padding(.vertical)
    }
}
