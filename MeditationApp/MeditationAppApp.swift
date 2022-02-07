//
//  MeditationAppApp.swift
//  MeditationApp
//
//  Created by user on 20.10.2021.
//

import SwiftUI

@main
struct MeditationAppApp: App {
    
    private var user = User(email: "", nickName: "", avatar: "", token: "")
    
    init(){
        //если в UserDefaultsData никнейм не пустой
        if UserDefaultsData.shared.getData(key: "user").nickName != ""{
            //тогда получаем данные
            self.user = UserDefaultsData.shared.getData(key: "user")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            //номер открывающейся страницы: если токен пустой, to открывается 1 страница, если нет 4
            Transition(numberPage: user.token == "" ? 1:4)
        }
    }
}
