//
//  LoginViewController.swift
//  Vome
//
//  Created by Bheem Singh on 10/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = StringConstant.LOGIN
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: ------------------------ Actions Mehtods -----------------------
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        pushToDrawerMenu()
    }
    @IBAction func pushToRegisterClicked(_ sender: UIButton) {
        pushToRegisterVC()
    }

    
    

}
