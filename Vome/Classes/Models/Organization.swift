//
//  Organization.swift
//  Vome
//
//  Created by Bheem Singh on 14/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

class Organization: Mappable {
    
    var organizationId:String?
    var organizationName:String?
    var isDeleted:Bool?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        organizationId         <- map["OrganizationId"]
        organizationName       <- map["OrganizationName"]
        isDeleted              <- map["Deleted"]
    }
    
}
