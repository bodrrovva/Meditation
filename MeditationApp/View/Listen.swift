//
//  Listen.swift
//  MeditationApp
//
//  Created by Student on 31.01.2022.
//
import SwiftUI

struct Listen: View {
    var body: some View {
        ZStack{
            Color("DarkGreen")
            VStack{
                Text("Tут будет \nпрослушивание").font(.custom("Alegreya-Medium", size: 30)).lineLimit(2).multilineTextAlignment(.leading)
            }.foregroundColor(.white)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Listen_Previews: PreviewProvider {
    static var previews: some View {
        Listen()
    }
}
