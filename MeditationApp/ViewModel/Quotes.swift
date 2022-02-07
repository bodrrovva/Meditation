//
//  Quotes.swift
//  MeditationApp
//
//  Created by Student on 07.02.2022.
//


import Foundation
import Alamofire
import SwiftyJSON

//объявление класса  quotes
class Quotes: ObservableObject {
    
    //объявление массива, обращаемся в модельку
    @Published var quotesArray: [QuotesModel] = []
    
    //загрузка
    init() {
        loadFeeling()
    }
    
    func loadFeeling() {
        
        //ссылка на апи
        let quotesURL = "http://mskko2021.mad.hakta.pro/api/quotes"
        
        //запррос данных
        AF.request(quotesURL, method: .get).validate().responseJSON {response in
            
            //swith case  с успешным и неуспешным кейсами
            switch response.result {
            
            //успешный кейс
            case.success(let value):
                let json = JSON(value)
                for i in 0..<json["data"].count {
                    self.quotesArray.append(
                        QuotesModel(
                            name: json["data"][i]["title"].stringValue,
                            icon: json["data"][i]["image"].stringValue,
                            description: json["data"][i]["description"].stringValue
                        ))
                }
            //кейс с ошибкой
            case .failure(let error):
                print (error)
            }
        }
    }
}
