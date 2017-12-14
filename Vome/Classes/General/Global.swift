//
//  Global.swift
//  Vome
//
//  Created by Bheem Singh on 14/12/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import Foundation
import UIKit


//MARK: -------------------------------- Variables --------------------------------------
let appDelegate = UIApplication.shared.delegate


//MARK: --------------------------------- Swift Guard -------------------------------------

func isGuardObject(_ value: Any?) -> Bool {
    guard let _ = value else {
        return false
    }
    return true
}


//MARK: --------------------------------- Methods -------------------------------------

func getResultDictWithoutDataKey(_ result: AnyObject?) ->Dictionary<String,AnyObject> {
    let finalResult = result as? Dictionary<String,AnyObject>
    return finalResult ?? [:]
    
}

func getResultDict(_ result: AnyObject?) -> Dictionary<String,AnyObject> {
    
    let finalResult = result as? Dictionary<String,AnyObject>
    if isGuardObject(finalResult as AnyObject?) {
        let resultDict = finalResult!["data"]  as? Dictionary<String,AnyObject>
        if isGuardObject(resultDict) {
            return resultDict!
        }
        
    }
    return [:]
    
}

func getResultArray(_ result: AnyObject?) -> [AnyObject] {
    
    let finalResult = result as? Dictionary<String,AnyObject>
    if isGuardObject(finalResult as AnyObject?) {
        let resultArray = finalResult!["data"]  as? [AnyObject]
        if isGuardObject(resultArray) {
            return resultArray!
        }
        
    }
    return []
    
}
