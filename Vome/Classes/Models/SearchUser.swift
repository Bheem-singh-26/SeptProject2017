//
//  SearchUser.swift
//  Vome
//
//  Created by Bheem Singh on 17/03/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchUser: Mappable {
    
    var id:String?
    var name:String?
    var email:String?
    var userType:String?
    var profileLink:String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id                     <- map["Id"]
        name                   <- map["Name"]
        email                  <- map["Email"]
        userType               <- map["UserType"]
        profileLink            <- map["ProfileLink"]
        
    }
    
}
