//
//  MainView.swift
//  MeditationApp
//
//  Created by user on 09.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct Main: View {
    
    @ObservedObject var feeling = Feeling()
    @ObservedObject var quotes = Quotes()
    
    @State var user = User(email: "", nickName: "", avatar: "", token: "")
    
    var body: some View {
        ZStack{
            Color("DarkGreen")
            VStack{
                //Верхняя панель управления
                HStack{
                    //1
                    Button(action: {
                        //
                    }, label: {
                        Image("hamburger").frame(width: 23, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.leading, 35)
                    })
                    Spacer()
                    //2
                    Button(action: {
                        //
                    }, label: {
                        Image("logo").resizable().frame(width: 75, height: 79, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    })
                    Spacer()
                    //3
                    Button(action: {
                        //
                    }, label: {
                        WebImage(url: URL(string: user.avatar)).placeholder(Image("avatar")).frame(width: 36.6, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.trailing, 30)
                    })
                }.padding(.top, 30)
                
                
                VStack{
                    Text("С возвращением, \(user.nickName)!").font(.custom("Alegreya", size: 30))
                    Text("Как ты сегодня себя чувствуешь?").font(.custom("Alegreya Sans", size: 20)).opacity(0.7)
                }
                
                VStack {
                    //горизонтальный скролл
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            //перебор массива с элементами
                            ForEach(feeling.feelingArray, id: \.self) { itemArray in
                                VStack {
                                    ZStack {
                                        //настраиваем контейнер, в которых будут элементы
                                        Rectangle().frame(width: 62, height: 65).foregroundColor(.white).cornerRadius(20)
                                        
                                        //берем картинки по ссылки
                                        WebImage(url: URL(string: itemArray.icon))
                                    }
                                    //Настраиваем текст
                                    Text(itemArray.name).font(.custom("AlegreyaSans-Regular", size: 12)).foregroundColor(.white)
                                }.frame(width: 105)
                            }
                        }
                    }).padding(.horizontal).padding(.bottom, 5)
                }
                
                
                //вертикальный скрол
                VStack{
                    ScrollView(.vertical, showsIndicators: false, content: {
                        ForEach(quotes.quotesArray, id: \.self) { itemArray in
                            HStack{
                                ZStack{
                                    //прямоугольник, контейнер с элементами
                                    Rectangle().frame(width: 340, height: 170).foregroundColor(.white).cornerRadius(20)
                                    
                                    //берем картинки для контейнера по ссылки из апи??????
                                    WebImage(url: URL(string: itemArray.icon)).frame(width: 340, height: 170, alignment: .trailing)
                                    VStack(alignment: .leading) {
                                        //настраиваем текст, который мы так же забраем с апи(заголовок)
                                        Spacer()
                                        Text(itemArray.name)
                                            .font(.custom("Alegreya", size: 25))
                                        
                                        //настраиваем другой текст
                                        Text(itemArray.description).font(.custom("Alegreya", size: 15)).lineLimit(2)
                                        
                                        Spacer()
                                        
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                            Text("Подробднее").foregroundColor(.white).font(.custom("Alegreya Sans", size: 15))
                                        }).frame(width: 140, height: 40).background(Color("DarkGreen")).cornerRadius(10)
                                        Spacer()
                                    }.frame(width: 200).padding(.leading, -100).foregroundColor(.black)
                                }
                            }
                        }
                    })
                }.padding(.bottom, 90)
                
            }.foregroundColor(.white)
        }.ignoresSafeArea()
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
