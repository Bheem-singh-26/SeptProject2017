//
//  ProfileViewTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 24/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class ProfileViewTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    var isOwnsProfile = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.layer.cornerRadius = userImage.bounds.height/2
        userImage.layer.masksToBounds = true
        if isOwnsProfile{
            self.followButton.isHidden = true
        }else{
            self.followButton.isHidden = false
        }
        
    }
    
    class func reuseIdentifier() -> String {
        
        return "ProfileViewTableViewCell"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func followBtnClicked(_ sender: UIButton) {
        
    }
    

}
