//
//  Validation.swift
//  Vome
//
//  Created by Bheem Singh on 17/12/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import Foundation
import UIKit

class Validation {
    
    //Check Weather string is Valid or Not
    class func isValidString(_ str: String?) -> Bool {
        
        if (str ?? "").isEmpty {
            return false
        }
        return true
    }

    //Check weather email address is valid
    class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    
}
