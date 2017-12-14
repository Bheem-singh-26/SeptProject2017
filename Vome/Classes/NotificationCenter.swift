//
//  NotificationCenter.swift
//  Vome
//
//  Created by Bheem Singh on 14/12/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import Foundation
import UIKit

class NotificationCenter: NSObject {
    
    // static let sharedInstance = NotificationCenterManager()
    
    public static let sharedInstance : NotificationCenter = {
        let notifcation = NotificationCenter()
        return notifcation
    } ()
    
    class func  ShowNormalAlert(title: String?, message: String?, actionTitle: String, complitionHandler: @escaping ((_ index: Int) -> Void) ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let DestructiveAction = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.cancel) {
            (result : UIAlertAction) -> Void in
            complitionHandler(0)
        }
        
        alertController.addAction(DestructiveAction)
        appDelegate?.window??.topMostController()?.present(alertController, animated: true, completion: nil)
        
    }

    
}
