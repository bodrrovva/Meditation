//
//  File.swift
//  MeditationApp
//
//  Created by user on 08.11.2021.
//

import SwiftUI

struct SignIn: View {
    
    @Binding var numberPage: Int
    @State var email: String = ""
    @State var password: String = ""
    @State var showAlert = false
    @State var errorMsg = ""
    
    @ObservedObject var auth = Auth()
    
    var body: some View {
        ZStack {
            Color("DarkGreen")
            VStack{
                Spacer()
                Image("background2").resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
            }
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: -17) {
                        Image("logo").resizable().frame(width: 80, height: 100, alignment: .leading).padding(.leading, -20)
                        Text("Sign in").font(.custom("Alegreya", size: 30))
                    }
                    Spacer()
                }.padding(.leading, 30)
                
                Spacer()
                
                customTextField(placeholder: Text("Email"), text: $email).padding(.bottom).foregroundColor(Color("Grey"))
                customSecureField(placeholder: Text("Password"), text: $password).foregroundColor(Color("Grey"))
                
                Spacer()
                
                Button(action: {
                    if email == "" || password == ""{
                        errorMsg = "Все поля должны быть заполнены"
                        showAlert.toggle()
                    }else if email.contains("@"){
                        auth.signIn(email: email, password: password){ user ,error in
                            if error != "Success"{
                                self.errorMsg = "Неверный логин или пароль"
                                showAlert.toggle()
                            }else{
                                numberPage = 4
                            }
                        }
                    } else {
                        errorMsg = "Email должен сожержать @"
                        showAlert.toggle()
                    }
                    
                }, label: {
                    Text("Войти").frame(width: 365, height: 61, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color("LightGreen")).cornerRadius(10.0)
                    
                }).padding(.bottom)
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text("Ошибка"), message: Text(errorMsg), dismissButton: .default(Text("OK")))
                        
                    })
                
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
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn(numberPage: .constant(2))
    }
}


