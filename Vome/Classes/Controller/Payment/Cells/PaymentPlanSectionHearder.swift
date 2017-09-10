//
//  PaymentPlanSectionHearder.swift
//  Vome
//
//  Created by Bheem Singh on 10/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class PaymentPlanSectionHearder: UITableViewHeaderFooterView {

    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    
    
    //MARk: ------------- Inti Methods ---------------
    
    class func reuseIdentifier() -> String{
        
        return "PaymentPlanSectionHearder"
        
    }
    

}
