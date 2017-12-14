//
//  ErrorResponse.swift
//  Vome
//
//  Created by Bheem Singh on 14/12/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper


class ErrorResponse: Mappable {
    
    var error = ""
    var error_description = ""
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        error    <- map["error"]
        error_description    <- map["error_description"]
    }
    
}
