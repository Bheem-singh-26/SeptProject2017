//
//  EditProfileImageTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 26/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit

class EditProfileImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.nameTextField.setCustomTextField()
        self.imageButton.layer.cornerRadius = self.imageButton.frame.height/2
        self.imageButton.clipsToBounds = true
    }

    class func reuseIdentifier() -> String {
        
        return "EditProfileImageTableViewCell"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func editImageButtonClicked(_ sender: UIButton) {
        
    }
    
    
    
}
