//
//  EventDate.swift
//  Vome
//
//  Created by Bheem Singh on 29/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

class EventDate: Mappable {
    
    var id:String?
    var deleted:Bool?
    var postId:String?
    var date:String?
    var startHour:String?
    var endHour:String?
    var totalHours:Int?
    var totalPlaces:Int?
    var placesLeft:Int?
    var type:String?
    var isComplete:Bool?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id               <- map["Id"]
        deleted          <- map["Deleted"]
        postId           <- map["BookedBookings"]
        date             <- map["Date"]
        startHour        <- map["StartHour"]
        endHour          <- map["EndHour"]
        totalHours       <- map["TotalHours"]
        totalPlaces      <- map["TotalPlaces"]
        placesLeft       <- map["PlacesLeft"]
        type             <- map["Type"]
        isComplete       <- map["IsComplete"]
        
    }
    
}
