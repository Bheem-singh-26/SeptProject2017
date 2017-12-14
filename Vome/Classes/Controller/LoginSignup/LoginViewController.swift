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
        self.usernameTextField.text = "emanuel.castiel@students.ha-mtl.org"
        self.passwordTextField.text = "Temppassword124"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: ------------------------ Actions Mehtods -----------------------
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        APImanager.login(apiService: .login(username: self.usernameTextField.text!, password: self.passwordTextField.text!)) { (response, errorMsg) in
            
            if isGuardObject(response){
                self.pushToDrawerMenu()
            }else{
                print("Login failed !!!!!!!")
            }
            
        }
        
    }
    
    
    @IBAction func pushToRegisterClicked(_ sender: UIButton) {
        self.pushToRegisterVC()
    }

    
    

}
