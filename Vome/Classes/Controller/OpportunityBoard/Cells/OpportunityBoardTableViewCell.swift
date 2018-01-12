//
//  OpportunityBoardTableViewCell.swift
//  Vome
//
//  Created by Bheem Singh on 16/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class OpportunityBoardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var availableSpotsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var post: PostResponse! {
        didSet {
            self.refreshData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    class func reuseIdentifier() -> String {
        
        return "OpportunityBoardTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refreshData() {
        
        self.titleLabel.text = self.post.title
        self.locationLabel.text = self.post.place
        self.availableSpotsLabel.text = "Only \(self.post.otherSlotsAvailable!) spots left"
        self.descriptionLabel.text = self.post.description
    }
    
    @IBAction func bookNowBtnClicked(_ sender: UIButton) {
        
    }
    
    
}












