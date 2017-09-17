//
//  OpportunityBoardTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 16/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class OpportunityBoardTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    class func reuseIdentifier() -> String {
        
        return "OpportunityBoardTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
