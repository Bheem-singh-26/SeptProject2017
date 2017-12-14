//
//  EnumConstant.swift
//  Vome
//
//  Created by Bheem Singh on 10/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import Foundation


enum APIHeaderEnum{
    
    public static let CONTENT_TYPE = "Content-Type"
    public static let CONTENT_TYPE_VALUE = "application/x-www-form-urlencoded"
    
}

enum APIStatusCode:Int{
    
    case statusCode_200 = 200
    case statusCode_401 = 401
    case statusCode_400 = 400
    
}
