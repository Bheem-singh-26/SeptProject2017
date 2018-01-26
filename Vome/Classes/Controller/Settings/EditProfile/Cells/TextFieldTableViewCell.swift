//
//  TextFieldTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 26/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var formTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.formTextField.setCustomTextField(borderColor: UIColor.themeGrayColor().cgColor)
    }
    
    class func reuseIdentifier() -> String {
        
        return "TextFieldTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
