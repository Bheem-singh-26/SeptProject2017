//
//  CustomSegmentedControl.swift
//  Vome
//
//  Created by Bheem Singh on 14/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit

class CustomSegmentedControl: UISegmentedControl {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        //self.backgroundColor = UIColor.themeGrayColor()
        self.tintColor = UIColor.themeGreenColor()
        //default title text color
        
        let normalFont = UIFont.openSans_14()
        
        let normalTextAttributes: [NSObject : AnyObject] = [
            NSForegroundColorAttributeName as NSObject: UIColor.white,
            NSFontAttributeName as NSObject: normalFont
        ]
        
        self.setTitleTextAttributes(normalTextAttributes as [NSObject : AnyObject] , for: .normal)
        self.setTitleTextAttributes(normalTextAttributes as [NSObject : AnyObject] , for: .selected)
        
    }

}
