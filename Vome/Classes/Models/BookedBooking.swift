//
//  BookedBooking.swift
//  Vome
//
//  Created by Bheem Singh on 29/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

class BookedBooking: Mappable {
    
    var id:String?
    var deleted:Bool?
    var eventDateId:String?
    var studentId:String?
    var regularUserId:String?
    var volunteerId:String?
    var status:String?
    var presence:String?
    var hoursDone:Int?
    var hoursClaimed:Double?
    var isNotifiedItIsUpcoming:Bool?
    var dateBooked:String?
    var startHour:String?
    var endHour:String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id                     <- map["Id"]
        deleted                <- map["Deleted"]
        eventDateId            <- map["EventDateId"]
        studentId              <- map["StudentId"]
        regularUserId          <- map["RegularUserId"]
        volunteerId            <- map["VolunteerId"]
        status                 <- map["Status"]
        presence               <- map["Presence"]
        hoursDone              <- map["HoursDone"]
        hoursClaimed           <- map["HoursClaimed"]
        isNotifiedItIsUpcoming <- map["IsNotifiedItIsUpcoming"]
        dateBooked             <- map["DateBooked"]
        startHour              <- map["StartHour"]
        endHour                <- map["EndHour"]
        
    }
    
}
