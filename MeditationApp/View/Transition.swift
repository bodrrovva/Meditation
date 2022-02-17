//
//  Transition.swift
//  MeditationApp
//
//  Created by Student on 07.02.2022.
//

import SwiftUI

struct Transition: View {
    
    @State var numberPage = 1
    @StateObject var auth = Auth()
    var body: some View {
        if numberPage == 1{
            Onboarding(numberPage: $numberPage)
        }else if numberPage == 2{
            SignIn(numberPage: $numberPage)
                .environmentObject(auth)
        }else if numberPage == 3{
            SignUp(numberPage: $numberPage)
        }else if numberPage == 4{
            Tab(numberPage: $numberPage)
                .environmentObject(auth)
        }
    }
}

struct Transition_Previews: PreviewProvider {
    static var previews: some View {
        Transition(numberPage: 3)
    }
}
