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

    class func loadNib<T: UIView>(_ viewType: T.Type) -> T {
        let className = String.className(viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: nil, options: nil)!.first as! T
    }
    
    class func loadNib() -> Self {
        return loadNib(self)
    }

    func addBorder(borderWidth width:CGFloat, color: UIColor){
        self.layer.borderWidth =  width
        self.layer.borderColor = color.cgColor
    }

    
}
