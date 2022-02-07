//
//  CustomTextField.swift
//  MeditationApp
//
//  Created by Student on 31.01.2022.
//

import SwiftUI

struct customTextField: View {
    var placeholder: Text
    @Binding var text: String
    
    var body : some View {
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder .font(.custom("Alegrey-Regular", size: 18)).foregroundColor(Color("Grey"))
            }
            VStack {
                TextField("", text: $text).disableAutocorrection(true).autocapitalization(.none).foregroundColor(Color("Grey"))
                
                Rectangle().frame(height: 1).foregroundColor(Color("Grey"))
            }.frame(width: UIScreen.main.bounds.width-60)
        }
    }
}

struct customSecureField: View {
    var placeholder: Text
    @Binding var text: String
    
    var body : some View {
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder .font(.custom("Alegrey-Regular", size: 18)).foregroundColor(Color("Grey"))
            }
            VStack {
                SecureField("", text: $text).disableAutocorrection(true).autocapitalization(.none).foregroundColor(Color("Grey"))
                
                Rectangle().frame(height: 1).foregroundColor(Color("Grey"))
            }.frame(width: UIScreen.main.bounds.width-60)
        }
    }
}
