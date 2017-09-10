//
//  OutlineButtonTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 10/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class OutlineButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var parentViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.childView.addBorder(borderWidth: 1, color: UIColor.themeRed1Color())
    }
    
    class func reuseIdentifier() -> String{
        
        return "OutlineButtonTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
