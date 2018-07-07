//
//  LoginToken.swift
//  Vome
//
//  Created by Bheem Singh on 14/12/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper


class LoginToken: Mappable {
    
    var id:String?
    var userName = ""
    var token_type = ""
    var access_token: String?
    var expires_in: Int?
    var issued: String?
    var expires: String?
    var userType: String?
    var profileImageUrl: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id                  <- map["id"]
        userName            <- map["userName"]
        token_type          <- map["token_type"]
        access_token        <- map["access_token"]
        expires_in          <- map["expires_in"]
        issued              <- map[".issued"]
        expires             <- map[".expires"]
        userType            <- map["userType"]
        profileImageUrl     <- map["profileImageUrl"]
    }
    
}




