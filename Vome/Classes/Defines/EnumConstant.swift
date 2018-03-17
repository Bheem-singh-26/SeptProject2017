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
    public static let AUTHORIZATION = "Authorization"
    
}

enum APIStatusCode:Int{
    
    case statusCode_200 = 200
    case statusCode_401 = 401
    case statusCode_400 = 400
    
}

enum EnumUserType:String{
    case admin = "Admin"
    case school = "School"
    case organization = "Organization"
    case volunteer = "RegularUser"
    case student = "Student"
    
    func valueOf() -> String{
        switch self {
        case .school:
            return "School"
        case .organization:
            return "Organization"
        case .volunteer:
            return "Volunteer"
        case .student:
            return "Student"
        case .admin:
            return "Admin"
        }
        
    }
    
}

