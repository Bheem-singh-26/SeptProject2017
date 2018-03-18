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
    var deleted:Bool?
    var boardId:String?
    var postInterestId:String?
    var posterType:String?
    var eventDescription:String?
    var streetAddress:String?
    var city:String?
    var postalCode:String?
    var country:String?
    var provinceState:String?
    var genderRequired:Bool?
    var minAge:String?
    var maxAge:String?
    var numberOfApplicants:String?
    var isVerifiedRequired:Bool?
    var doc_CVRequired:Bool?
    var doc_PoliceRecordRequired:Bool?
    var doc_SchoolTranscriptRequired:Bool?
    var doc_VomeResumeRequired:Bool?
    var doc_VomeTranscriptRequired:Bool?
    var scheduleType:String?
    var personResponsible:String?
    var position:String?
    var email:Bool?
    var phoneNumber:Bool?
    var link:String?
    var published:String?
    var datePosted:String?
    
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
        deleted             <- map["Deleted"]
        boardId             <- map["BoardId"]
        postInterestId      <- map["PostInterestId"]
        posterType          <- map["PosterType"]
        eventDescription    <- map["EventDescription"]
        streetAddress       <- map["StreetAddress"]
        city                <- map["City"]
        postalCode          <- map["PostalCode"]
        country             <- map["Country"]
        provinceState       <- map["ProvinceState"]
        genderRequired      <- map["genderRequired"]
        minAge              <- map["MinAge"]
        maxAge              <- map["MaxAge"]
        isVerifiedRequired  <- map["IsVerifiedRequired"]
        doc_CVRequired      <- map["Doc_CVRequired"]
        doc_PoliceRecordRequired         <- map["Doc_PoliceRecordRequired"]
        doc_SchoolTranscriptRequired     <- map["Doc_SchoolTranscriptRequired"]
        doc_VomeResumeRequired           <- map["Doc_VomeResumeRequired"]
        doc_VomeTranscriptRequired       <- map["Doc_VomeTranscriptRequired"]
        scheduleType                     <- map["ScheduleType"]
        position                         <- map["Position"]
        email                            <- map["Email"]
        phoneNumber                      <- map["PhoneNumber"]
        link                             <- map["Link"]
        published                        <- map["Published"]
        datePosted                       <- map["DatePosted"]
        
    }
    
}
