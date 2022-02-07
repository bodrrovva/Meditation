//
//  SignUp.swift
//  MeditationApp
//
//  Created by Student on 31.01.2022.
//

import SwiftUI


struct SignUp: View {
    
    @Binding var numberPage: Int
    
    var body: some View {
        ZStack{
            Color("DarkGreen")
            VStack{
                Spacer()
                Text("Tут будет \nрегистрация").font(.custom("Alegreya-Medium", size: 30)).lineLimit(2).multilineTextAlignment(.leading)
                Spacer()
                Button(action: {
                    numberPage = 1
                }){
                    Text("Назад")
                }.frame(width: 321, height: 61).background(Color("LightGreen")).cornerRadius(10.0)
                    .padding(.bottom,50)
            }.foregroundColor(.white)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(numberPage: .constant(3))
    }
}
