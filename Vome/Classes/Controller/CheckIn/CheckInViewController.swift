//
//  CheckInViewController.swift
//  Vome
//
//  Created by Bheem Singh on 24/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class CheckInViewController: BaseViewController {
    
    @IBOutlet weak var checkStatus: UIView!
    @IBOutlet weak var checkStatusButton: UIButton!
    @IBOutlet weak var checkStatusView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = StringConstant.CHECKIN
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkInButtonClicked(_ sender: UIButton) {
        
        self.checkStatusView.isHidden = false
        
    }
    
    

}
