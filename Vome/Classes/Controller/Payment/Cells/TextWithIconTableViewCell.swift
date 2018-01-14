//
//  TextWithIconTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 10/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class TextWithIconTableViewCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var cellTextLabel: UILabel!
    
    var labelTextStrig: String!{
        didSet{
            refreshData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cellTextLabel.sizeToFit()
        self.cellTextLabel.textAlignment = .left
        
        self.cellTextLabel.font = UIFont.openSans_14()
    }
    
    class func reuseIdentifier() -> String {
        
        return "TextWithIconTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refreshData(){
        self.cellTextLabel.text = labelTextStrig
    }
    
    
}
