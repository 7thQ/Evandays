//
//  loginModel.swift
//  Evandays
//
//  Created by David on 4/22/24.
//


import Foundation

@Observable
class whoLoggedIn: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _inputUsername = "inpurUsername"
        case _password = "password"
    }
    
    var inputUsername: String = ""
    var password: String = ""
    

}
