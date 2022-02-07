//
//  Profile.swift
//  MeditationApp
//
//  Created by Student on 31.01.2022.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack{
            Color("DarkGreen")
            VStack{
                Text("Profile")
            }.foregroundColor(.white)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
