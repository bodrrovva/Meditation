//
//  ContentView.swift
//  MeditationApp
//
//  Created by user on 20.10.2021.
//

import SwiftUI

struct Onboarding: View {
    
    @Binding var numberPage: Int
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
            VStack{
                Image("logo")
                Text("ПРИВЕТ").font(.custom("Alegreya-Medium", size: 34))
                Text("Наслаждайся отборочным.\n Будь внимателен.\n Делай хорошо.").lineLimit(3).font(.custom("Alegreya Sans", size: 20)).multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                    numberPage = 2
                }){
                    Text("Войти в аккаунт")
                }.frame(width: 321, height: 61).background(Color("LightGreen")).cornerRadius(10.0)
                .padding(.bottom, 10)
                HStack(spacing: 1) {
                    Text("Еще нет аккаунта?").font(.custom("Alegreya", size: 17.0))
                    Text("Зарегистрируйтесь").font(.custom("Alegreya-Medium", size: 18.0)).underline()
                        .onTapGesture {
                            numberPage = 3
                        }
                }
                Spacer()
            }.foregroundColor(.white)
        }.edgesIgnoringSafeArea(.all)
            .onAppear {
                print("Экран Загружен")
            }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(numberPage: .constant(1))
    }
}
