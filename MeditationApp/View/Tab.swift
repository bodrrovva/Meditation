//
//  Tab.swift
//  MeditationApp
//
//  Created by Student on 07.02.2022.
//

import SwiftUI

struct Tab: View {
    
    @Binding var numberPage : Int
    @State var selected = 1
    
    var body: some View {
        ZStack {
            TabView(selection: $selected) {
                Main().tabItem { selected == 1 ? Image("logoMini"):Image("unLogo") }.tag(1)
                Listen().tabItem { selected == 2 ? Image("sound"):Image("unSound")}.tag(2)
                Profile().tabItem { selected == 3 ? Image("profile"):Image("unProfile") }.tag(3)
            }
        }
        
    }
}
