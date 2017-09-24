//
//  MenuTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 24/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    class func reuseIdentifier() -> String {
        return "MenuTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
