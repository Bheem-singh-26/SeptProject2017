//
//  ProfileResponse.swift
//  Vome
//
//  Created by Puneet JR on 13/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

class ProfileResponse: Mappable {
    
    var id:String?
    var profileImageUrl:String?
    var userType:String?
    var firstName:String?
    var lastName:String?
    var name:String?
    var email:String?
    var description:String? = ""
    var dateOfBirth:String?
    var occupation:String?
    var gender:String?
    var streetAddress:String?
    var city:String? = ""
    var postalCode:String?
    var country:String? = ""
    var provinceState:String? = ""
    var phoneNumber:String?
    var opportunityPublished:Int?
    var contactPosition:String?
    var website:String?
    var facebookUsername:String?
    var twitterUsername:String?
    var linkedIn:String?
    var googlePlus:String?
    var youtube:String?
    var interests:[UserInterest]?
    var followOrganisations:[Organization]?
    var verifiedTotalHours:Int?
    var grade:Int?
    var totalHoursDone:Int?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id                      <- map["Id"]
        profileImageUrl         <- map["ProfileImageUrl"]
        userType                <- map["UserType"]
        firstName               <- map["FirstName"]
        lastName                <- map["LastName"]
        name                    <- map["Name"]
        email                   <- map["Email"]
        description             <- map["Description"]
        dateOfBirth             <- map["DateOfBirth"]
        occupation              <- map["Occupation"]
        gender                  <- map["Gender"]
        streetAddress           <- map["StreetAddress"]
        city                    <- map["City"]
        postalCode              <- map["PostalCode"]
        country                 <- map["Country"]
        provinceState           <- map["ProvinceState"]
        phoneNumber             <- map["PhoneNumber"]
        opportunityPublished    <- map["OpportunityPublished"]
        contactPosition         <- map["ContactPosition"]
        website                 <- map["Website"]
        facebookUsername        <- map["FacebookUsername"]
        twitterUsername         <- map["TwitterUsername"]
        linkedIn                <- map["LinkedIn"]
        googlePlus              <- map["GooglePlus"]
        youtube                 <- map["Youtube"]
        interests               <- map["Interests"]
        followOrganisations     <- map["FollowOrganisations"]
        verifiedTotalHours      <- map["VerifiedTotalHours"]
        grade                   <- map["Grade"]
        totalHoursDone          <- map["TotalHoursDone"]
    }
    
}
