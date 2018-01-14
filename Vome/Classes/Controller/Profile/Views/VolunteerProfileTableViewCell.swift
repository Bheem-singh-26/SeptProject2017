//
//  VolunteerProfileTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 14/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit

class VolunteerProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var verifiedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.layer.cornerRadius = userImage.bounds.height/2
        userImage.layer.masksToBounds = true
    }
    
    class func reuseIdentifier() -> String {
        return "VolunteerProfileTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
