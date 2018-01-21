//
//  UITextField+Extension.swift
//  Vome
//
//  Created by Bheem Singh on 21/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import UIKit


extension UITextField {
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
    
    func setCustomTextField(leftIcon: UIImage? = nil) {
        
        self.placeHolderColor = UIColor.themeWhiteColor()
        
        if leftIcon != nil{
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = leftIcon
            self.leftView = imageView
            self.leftViewMode = UITextFieldViewMode.always
        }
        
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    
    
}
