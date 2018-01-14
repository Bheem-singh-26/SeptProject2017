//
//  UIImageView+Extension.swift
//  Vome
//
//  Created by Bheem Singh on 14/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

extension UIImageView {
    
    func setImageFrom(url imageUrl: String?, placeHolder:UIImage){
        if let imageUrlStr = imageUrl, imageUrlStr != ""{
            self.af_setImage(withURL: URL(string:imageUrlStr)!, placeholderImage: placeHolder, completion: { (image) in
                
            })
        }else{
            self.image = placeHolder
        }
    }
    
    
}
