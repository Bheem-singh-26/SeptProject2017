//
//  OpportunityPosts.swift
//  Vome
//
//  Created by Puneet JR on 10/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper


class OpportunityPosts: Mappable {
    
    var oneTimerPostList:[PostResponse]?
    var pledgePostList:[PostResponse]?
    var oneTimerCount:Int?
    var pledgeCount:Int?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        oneTimerPostList    <- map["OneTimerPostList"]
        pledgePostList      <- map["PledgePostList"]
        oneTimerCount    <- map["OneTimerCount"]
        pledgeCount      <- map["PledgeCount"]
        
    }
    
}
