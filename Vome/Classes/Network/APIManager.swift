//
//  APIManager.swift
//  TransportMap
//
//  Created by Bheem Singh on 17/08/17.
//  Copyright © 2017 Sonia Yadav. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class APImanager {
    
    fileprivate static let baseUrl = "https://vomedev.azurewebsites.net/"
    
    enum APIService{
        
        case login(username: String, password: String)
        case register(username: String, password: String, userType:String)
        case payment
        case opportunityBoardPostList
        case profileDetails(userId: String)
        case opportunityDetailView(id:String)
        case searchUser(text: String)
        
        var path: String {
            switch self {
            case .login:
                return baseUrl + "Token"
            case .register:
                return baseUrl + "api/profileapi/RegisterUser"
            case .opportunityBoardPostList:
                return baseUrl + "api/posts_api/GetAllPosts"
            case let .profileDetails(userId):
                return baseUrl + "api/profileapi/myprofile/" + userId
            case let .opportunityDetailView(id):
                return baseUrl + "api/Posts_Api/MyOpportunityDetail/" + id
            case let .searchUser(text):
                return baseUrl + "api/ProfileAPI/SearchUsers?request=" + text
            
            default:
                return ""
            }
        }
        
        var parameters: [String: Any] {
            switch self {
            case let .login(username, password):
                let params = ["grant_type": "password","username": username, "password": password]
                return params
                
            case let .register(username, password, userType):
                let params = ["Email": username, "Password": password, "PosterType": userType, "ConfirmPassword": password]
                return params
                
                
            default:
                return ["": ""]
            }
        }
        
        var method: HTTPMethod {
            
            switch self {
            case .login, .register:
                return .post
                
            default:
                return .get
            }
        }
        
    }
    
    class func login(apiService: APIService, handler: @escaping (_ user: LoginToken?, _ error: AnyObject?) -> ()) {
        
        NetworkManager.shareInstance.callServiceWithName(apiService.path, method: apiService.method, param: apiService.parameters, callbackSuccess: { (response) in
            
            let objectModel = LoginToken(JSON: response as! [String : Any])
            handler(objectModel, nil)
            
        }) { (failureResponse) in
            print(failureResponse as Any)
            handler(nil, failureResponse)
            
        }
    }
    
    class func register(apiService: APIService, handler: @escaping (_ user: LoginToken?, _ error: AnyObject?) -> ()) {
        
        NetworkManager.shareInstance.callServiceWithName(apiService.path, method: apiService.method, param: apiService.parameters, callbackSuccess: { (response) in
            
            let objectModel = LoginToken(JSON: response as! [String : Any])
            handler(objectModel, nil)
            
        }) { (failureResponse) in
            print(failureResponse as Any)
            handler(nil, failureResponse)
            
        }
    }
    
    class func opportunityPosts(apiService: APIService, handler: @escaping (_ posts: OpportunityPosts?, _ error: AnyObject?) -> ()) {
        
        NetworkManager.shareInstance.callServiceWithName(apiService.path, method: apiService.method, param: apiService.parameters, callbackSuccess: { (response) in
            
            let objectModel = OpportunityPosts(JSON: response as! [String : Any])
            handler(objectModel, nil)
            
        }) { (failureResponse) in
            print(failureResponse as Any)
            handler(nil, failureResponse)
            
        }
    }
    
    class func profileDetails(apiService: APIService, handler: @escaping (_ details: ProfileResponse?, _ error: AnyObject?) -> ()) {
        
        NetworkManager.shareInstance.callServiceWithName(apiService.path, method: apiService.method, param: apiService.parameters, callbackSuccess: { (response) in
            
            let objectModel = ProfileResponse(JSON: response as! [String : Any])
            handler(objectModel, nil)
            
        }) { (failureResponse) in
            print(failureResponse as Any)
            handler(nil, failureResponse)
            
        }
    }
    
    class func opportunityDetailView(apiService: APIService, handler: @escaping (_ details: EventDetails?, _ error: AnyObject?) -> ()) {
        
        NetworkManager.shareInstance.callServiceWithName(apiService.path, method: apiService.method, param: apiService.parameters, callbackSuccess: { (response) in
            
            let objectModel = EventDetails(JSON: response as! [String : Any])
            handler(objectModel, nil)
            
        }) { (failureResponse) in
            print(failureResponse as Any)
            handler(nil, failureResponse)
            
        }
    }
    
    class func searchUser(apiService: APIService, handler: @escaping (_ users: [SearchUser]?, _ error: AnyObject?) -> ()) {
        
        NetworkManager.shareInstance.callServiceWithName(apiService.path, method: apiService.method, param: apiService.parameters, callbackSuccess: { (response) in
            
            let objectArray = Mapper<SearchUser>().mapArray(JSONObject: response)
            handler(objectArray, nil)
            
        }) { (failureResponse) in
            print(failureResponse as Any)
            handler(nil, failureResponse)
            
        }
    }

    
}




















