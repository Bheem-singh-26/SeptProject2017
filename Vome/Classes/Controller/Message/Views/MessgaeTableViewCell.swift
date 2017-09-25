//
//  MessgaeTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 25/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class MessgaeTableViewCell: UITableViewCell {

    @IBOutlet weak var senderImage: UIImageView!
    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var sentTime: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        senderImage.layer.cornerRadius = senderImage.layer.bounds.height/2
        senderImage.layer.masksToBounds = true
    }

    class func reuseIdentifier() -> String {
        
        return "MessgaeTableViewCell"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
