//
//  Feeling.swift
//  MeditationApp
//
//  Created by Student on 07.02.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

//объявление класса feeling
class Feeling: ObservableObject {
    
    //массив, обращается в MainModel
    @Published var feelingArray: [FeelingModel] = []
    
    //загрузка
    init() {
        loadFeeling()
    }
    
    func loadFeeling() {
        
        //ссылка на апи
        let url = "http://mskko2021.mad.hakta.pro/api/feelings"
        
        //запрос
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            //успешный кейс
            case .success(let value):
                let json = JSON(value)
                //цикл, чтобы забрать все данные
                for i in 0..<json["data"].count {
                    //прописываем какие данные нужно забрать
                    self.feelingArray.append(
                        FeelingModel(
                            name: json["data"][i]["title"].stringValue,
                            icon: json["data"][i]["image"].stringValue,
                            position: json["data"][i]["position"].intValue
                        ))
                }
            //кейс с ошибкой
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
