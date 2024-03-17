//
//  EvandaysApp.swift
//  Evandays
//
//  Created by David on 3/12/24.
//

//import SwiftUI
//
//@main
//struct EvandaysApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


import SwiftUI

@main
struct EAHApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                custNav()
            } else {
                SimpleRequestView()
            }
        }
    }
}





#Preview{
    custNav()
//    LoginView()
//    SimpleRequestView()
}
