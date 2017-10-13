//
//  LoginViewController.swift
//  Vome
//
//  Created by Bheem Singh on 10/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: ------------------------ IBOutlets / Variables -----------------------
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
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
        
        let apiService: APImanager.APIService = APImanager.APIService.login(username: self.usernameTextField.text!, password: self.passwordTextField.text!)
        
        NetworkManager.shareInstance.callServiceWithName(apiService.path, method: apiService.method, param: apiService.parameters, callbackSuccess: { (response) in
            
            self.pushToDrawerMenu()
            
        }) { (errorMsg) in
            print("Login failed !!!!!!!")
        }
        
    }
    @IBAction func pushToRegisterClicked(_ sender: UIButton) {
        self.pushToRegisterVC()
    }

    
    

}
