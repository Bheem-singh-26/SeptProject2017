//
//  RegisterViewController.swift
//  Vome
//
//  Created by Puneet JR on 17/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = StringConstant.REGISTER

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: ------------------------ Default Mehtods -----------------------
    
    @IBAction func registerButtonClicked(_ sender: UIButton) {
        
        pushToDrawerMenu()
    }
    
    @IBAction func pushToLoginClicked(_ sender: UIButton) {
        pushToLoginVC()
    }
    
    

}
