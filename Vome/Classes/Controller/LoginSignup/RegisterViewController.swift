//
//  RegisterViewController.swift
//  Vome
//
//  Created by Puneet JR on 17/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit
import SVProgressHUD


class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailtextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    @IBOutlet weak var segmentView: CustomSegmentedControl!
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    //MARK: ------------------------ Default Mehtods -----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = StringConstant.REGISTER
        
        initializeView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeView(){
    
        self.emailtextfield.setCustomTextField()
        self.passwordTextfield.setCustomTextField()
        self.confirmPassTextField.setCustomTextField()
        
        self.signInButton.addBorder(borderWidth: 1.0, color: UIColor.white)
    }
    
    //MARK: ------------------------ Methods -----------------------

    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func validateForm() -> Bool{
    
        if (self.emailtextfield.text?.isEmpty)! || (self.passwordTextfield.text?.isEmpty)! || (self.confirmPassTextField.text?.isEmpty)!{
            self.showAlert(title: nil, message: "You must have fill all the fields", actionTitle: "Ok", complitionHandler: nil)
            return false
        }else if self.passwordTextfield.text != self.confirmPassTextField.text{
            self.showAlert(title: nil, message: "Password does not match the confirm password", actionTitle: "Ok", complitionHandler: nil)
            return false
        }else if !Validation.isValidEmail(testStr: self.emailtextfield.text!){
            self.showAlert(title: nil, message: "Please enter a valid email address", actionTitle: "Ok", complitionHandler: nil)
            return false
        }
        
        
        return true
    }
    
    // return the selected row data
//    func rowDidSelectGesture(tapRecognizer:UITapGestureRecognizer)
//    {
//        if (tapRecognizer.state == UIGestureRecognizerState.ended)
//        {
//            let rowHeight : CGFloat  = self.pickerView.rowSize(forComponent: 0).height
//            let selectedRowFrame: CGRect = self.pickerView.bounds.insetBy(dx: 0.0, dy: (self.pickerView.frame.height - rowHeight) / 2.0 )
//            let userTappedOnSelectedRow = (selectedRowFrame.contains(tapRecognizer.location(in: pickerView)))
//            if (userTappedOnSelectedRow)
//            {
//                let selectedRow = self.pickerView.selectedRow(inComponent: 0)
//                //do whatever you want here
//                //print("------- row selected --------")
//                self.userTypeBtn.setTitle(pickerDataSource[selectedRow], for: .normal)
//                self.selectedUserType = pickerDataSource[selectedRow]
//                self.pickerView.isHidden = true
//                
//            }
//        }
//    }
    
    //MARK: ------------------------ Actions -----------------------
    
    @IBAction func registerButtonClicked(_ sender: UIButton) {
        
        let userType = self.segmentView.selectedSegmentIndex == 0 ? EnumUserType.voulenteer : EnumUserType.organization
                
        //self.pushToOpportunityBoard()
        
//        if validateForm(){
//            SVProgressHUD.show()
//            
//            APImanager.register(apiService: .register(username: self.emailtextfield.text!, password: self.passwordTextfield.text!, userType: (userType?.valueOf())!), handler: { (response, errorMsg) in
//                
//                SVProgressHUD.dismiss()
//                if isGuardObject(response){
//                    print("Done!!!!!!!")
//                    self.pushToDrawerMenu()
//                }
//                
//            })
//        }
        
        //pushToDrawerMenu()
    }
    
    @IBAction func pushToLoginClicked(_ sender: UIButton) {
        pushToLoginVC()
    }
    

}






