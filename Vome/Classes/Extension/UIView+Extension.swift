//
//  UIView+Extension.swift
//  Vome
//
//  Created by Bheem Singh on 10/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import Foundation
import UIKit

extension UIView{


    func addBorder(borderWidth width:CGFloat, color: UIColor){
        self.layer.borderWidth =  width
        self.layer.borderColor = color.cgColor
    }

}
