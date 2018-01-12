//
//  PostResponse.swift
//  Vome
//
//  Created by Puneet JR on 10/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

class PostResponse: Mappable {
    
    var id:String?
    var posterId:String?
    var posterProfilePicUrl:String?
    var title:String?
    var description:String?
    var upcomingDate:String?
    var otherSlotsAvailable:Int?
    var detailViewLink:String?
    var place:String?
    var applicationDeadLine:String?
    var listInterests:[String]?
    var postType:String?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id                  <- map["Id"]
        posterId            <- map["PosterId"]
        posterProfilePicUrl <- map["PosterProfilePicUrl"]
        title               <- map["Title"]
        description         <- map["Description"]
        upcomingDate        <- map["UpcomingDate"]
        otherSlotsAvailable <- map["OtherSlotsAvailable"]
        detailViewLink      <- map["DetailViewLink"]
        place               <- map["Place"]
        applicationDeadLine <- map["ApplicationDeadLine"]
        listInterests       <- map["ListInterests"]
        postType            <- map["PostType"]
    }
    
}
