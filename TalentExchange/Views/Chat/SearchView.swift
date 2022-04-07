//
//  SearchView.swift
//  TalentExchange
//
//  Created by 임영후 on 2022/04/07.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        VStack{

                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Search", text: $searchText)
                        .foregroundColor(.primary)
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
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
