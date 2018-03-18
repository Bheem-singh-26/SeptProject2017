//
//  LoginViewController.swift
//  Vome
//
//  Created by Bheem Singh on 10/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {

    //MARK: ------------------------ IBOutlets / Variables -----------------------
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = StringConstant.LOGIN
        
        initializeView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initializeView(){
        
        self.usernameTextField.text = "natadmin@acorncanada.org"
        self.passwordTextField.text = "Temppassword124"
        self.usernameTextField.setCustomTextField(leftIcon: #imageLiteral(resourceName: "UserIcon"))
        self.passwordTextField.setCustomTextField(leftIcon: #imageLiteral(resourceName: "LockIcon"))
        
        self.signUpButton.addBorder(borderWidth: 1.0, color: UIColor.white)
        
    }
    
    
    //MARK: ------------------------ Actions Mehtods -----------------------
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        SVProgressHUD.show()
        APImanager.login(apiService: .login(username: self.usernameTextField.text!, password: self.passwordTextField.text!)) { (response, errorMsg) in
            
            SVProgressHUD.dismiss()
            if isGuardObject(response){
                AppUser.sharedInstance = response
                USER_TOKEN = (response?.access_token)!
                USER_AUTHORIZATION = (response?.token_type.capitalized)! + " " + (response?.access_token)!
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
