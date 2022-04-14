//
//  PickerView.swift
//  TalentExchange
//
//  Created by KimJS on 2022/04/11.
//

import SwiftUI

struct PickerView: View {
    
    @Binding var isProfile: String
     
    var body: some View {

        Picker("Submenu", selection: $isProfile){
            Text("탐색").tag(Submenu.Explore.rawValue)
            Text("프로필").tag(Submenu.Profile.rawValue)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal, 150)
    }
}
