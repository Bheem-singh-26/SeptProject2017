//
//  SearchTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 17/03/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userType: UILabel!
    
    var searchUser: SearchUser!{
        didSet{
            self.refreshData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func reuseIdentifier() -> String {
        return "SearchTableViewCell"
    }
    
    func refreshData(){
        
        self.userName.text = self.searchUser.name
        self.userImage.setImageFrom(url: self.searchUser.profileLink, placeHolder: #imageLiteral(resourceName: "UserIcon"))
        
    }
    
}
