//
//  DrawerMenuViewController.swift
//  Vome
//
//  Created by Bheem Singh on 24/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class DrawerMenuViewController: SlideMenuController {

    
    //MARK: ------------------------- init methods--------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        SlideMenuOptions.leftViewWidth = 80
        SlideMenuOptions.contentViewScale = 0.50
        
        // Open
        self.slideMenuController()?.openLeft()
        // close
        self.slideMenuController()?.closeLeft()

    }
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: StoryboardVCIdentifier.opportunityBoard.rawValue) {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Left") {
            self.leftViewController = controller
        }
        super.awakeFromNib()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
