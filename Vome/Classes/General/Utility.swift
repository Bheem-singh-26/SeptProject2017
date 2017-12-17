//
//  Utility.swift
//  Vome
//
//  Created by Bheem Singh on 14/12/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD


class Utility{

    
    class func handleAPIErrorResponse(){
        
    }
    
    class func hideSVProgressHud(){
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    
}
