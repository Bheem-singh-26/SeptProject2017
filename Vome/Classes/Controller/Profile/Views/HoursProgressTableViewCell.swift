//
//  HoursProgressTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 21/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit

class HoursProgressTableViewCell: UITableViewCell {

    
    @IBOutlet weak var completedHourCount: UILabel!
    
    @IBOutlet weak var completedHourLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class func reuseIdentifier() -> String {
        
        return "HoursProgressTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
