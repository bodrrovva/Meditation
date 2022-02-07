//
//  UserDef.swift
//  MeditationApp
//
//  Created by Student on 07.02.2022.
//

import Foundation

class UserDefaultsData {
    
    
    static let shared = UserDefaultsData()
    
    //функция получения данных
    func getData(key: String) -> User {
        if let userData = UserDefaults.standard.object(forKey: key) as? Data  {
            //декодируем данные
            if let user = try? PropertyListDecoder().decode(User.self, from: userData) {
                //получаем константу user
                return user
            }
        }
        //получаем массив
        return User(email: "", nickName: "", avatar: "", token: "")
    }
}
