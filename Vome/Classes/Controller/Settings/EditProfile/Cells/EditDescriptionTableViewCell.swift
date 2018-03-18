//
//  EditDescriptionTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 26/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit

class EditDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var formTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.formTextView.placeholderText = "Enter description"
    }
    
    class func reuseIdentifier() -> String {
        
        return "EditDescriptionTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
