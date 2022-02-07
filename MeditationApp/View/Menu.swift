//
//  Menu.swift
//  MeditationApp
//
//  Created by Student on 31.01.2022.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        ZStack{
            Color("DarkGreen")
            VStack{
        Text("Tут будет меню").font(.custom("Alegreya-Medium", size: 30))
            }.foregroundColor(.white)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
