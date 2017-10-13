//
//  APIManager.swift
//  TransportMap
//
//  Created by Bheem Singh on 17/08/17.
//  Copyright © 2017 Sonia Yadav. All rights reserved.
//

import Foundation
import Alamofire

class APImanager {
    
    fileprivate static let baseUrl = "http://vomewebsite20171002054356.azurewebsites.net/TOKEN"
    
    enum APIService{
        
        case login(username: String, password: String)
        case register(username: String, password: String)
        
        
        var path: String {
            switch self {
            case .login , .register:
                return baseUrl
                
            default:
                return ""
            }
        }
        
        var parameters: [String: Any] {
            switch self {
            case let .login(username, password):
                let params = ["grant_type": "password","username": username, "password": password]
                return params
                
            case let .register(username, password):
                let params = ["email": username, "password": password]
                return params
                
            default:
                return ["": ""]
            }
        }
        
        var method: HTTPMethod {
            
            switch self {
            case .login:
                return .post
            case .register:
                return .put
            
            default:
                return .post
            }
        }

        
        
    }
    
    
}
