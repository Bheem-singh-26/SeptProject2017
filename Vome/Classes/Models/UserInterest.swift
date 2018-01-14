//
//  UserInterest.swift
//  Vome
//
//  Created by Bheem Singh on 14/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

class UserInterest: Mappable {
    
    var id:String?
    var name:String?
    var nameFR:String?
    var isSelected:Bool?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id           <- map["Id"]
        name         <- map["Name"]
        nameFR       <- map["NameFR"]
        isSelected   <- map["Selected"]
    }
    
}
