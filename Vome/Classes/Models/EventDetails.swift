//
//  EventDetails.swift
//  Vome
//
//  Created by Bheem Singh on 29/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

class EventDetails: Mappable {
    
    var post:PostResponse?
    var eventDates:[EventDate]?
    var bookedBookings:[BookedBooking]?
    var isPostOwner:Bool?
    var isMyPost:String?
    var hasDates:Bool?
    var hasDatesNotPassed:Bool?
    var hasStudentBookings:Bool?
    var allSpotsFull:Bool?
    var currentUser:String?
    var tabSwitch:String?
    var reviewCount:Int?
    var reviewRating:String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        post                <- map["Post"]
        eventDates          <- map["EventDates"]
        bookedBookings      <- map["BookedBookings"]
        isPostOwner         <- map["IsPostOwner"]
        isMyPost            <- map["IsMyPost"]
        hasDates            <- map["HasDates"]
        hasDatesNotPassed   <- map["HasDatesNotPassed"]
        hasStudentBookings  <- map["HasStudentBookings"]
        allSpotsFull        <- map["AllSpotsFull"]
        currentUser         <- map["CurrentUser"]
        tabSwitch           <- map["TabSwitch"]
        reviewCount         <- map["ReviewCount"]
        reviewRating        <- map["ReviewRating"]
        allSpotsFull        <- map["AllSpotsFull"]
        currentUser         <- map["CurrentUser"]
    }
    
}
