//
//  RegisterViewController.swift
//  Vome
//
//  Created by Puneet JR on 17/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit
import SVProgressHUD


class RegisterViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {

    @IBOutlet weak var userTypeBtn: UIButton!
    @IBOutlet weak var emailtextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerDataSource = ["School", "Organization", "Voulenteer"]
    var selectedUserType = ""
    
    //MARK: ------------------------ Default Mehtods -----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = StringConstant.REGISTER
        initializeSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initializeSubviews(){
        
        self.userTypeBtn.backgroundColor = UIColor.white
        self.userTypeBtn.layer.cornerRadius = 3
        
        self.pickerView.isHidden = true
        self.pickerView.backgroundColor = UIColor.white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(rowDidSelectGesture))
        tapGesture.delegate = self
        self.pickerView.addGestureRecognizer(tapGesture)
        
    }
    
    //MARK: ------------------------ Methods -----------------------
    
    
    func showPickerView(){
        self.pickerView.isHidden = false
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func validateForm() -> Bool{
    
        if self.selectedUserType.isEmpty{
            self.showAlert(title: nil, message: "You must have select a type", actionTitle: "Ok", complitionHandler: nil)
            return false
            
        }else if (self.emailtextfield.text?.isEmpty)! || (self.passwordTextfield.text?.isEmpty)! || (self.confirmPassTextField.text?.isEmpty)!{
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
    func rowDidSelectGesture(tapRecognizer:UITapGestureRecognizer)
    {
        if (tapRecognizer.state == UIGestureRecognizerState.ended)
        {
            let rowHeight : CGFloat  = self.pickerView.rowSize(forComponent: 0).height
            let selectedRowFrame: CGRect = self.pickerView.bounds.insetBy(dx: 0.0, dy: (self.pickerView.frame.height - rowHeight) / 2.0 )
            let userTappedOnSelectedRow = (selectedRowFrame.contains(tapRecognizer.location(in: pickerView)))
            if (userTappedOnSelectedRow)
            {
                let selectedRow = self.pickerView.selectedRow(inComponent: 0)
                //do whatever you want here
                //print("------- row selected --------")
                self.userTypeBtn.setTitle(pickerDataSource[selectedRow], for: .normal)
                self.selectedUserType = pickerDataSource[selectedRow]
                self.pickerView.isHidden = true
                
            }
        }
    }
    
    //MARK: ------------------------ Actions -----------------------
    
    @IBAction func registerButtonClicked(_ sender: UIButton) {
        
        let userType = EnumUserType(rawValue: (self.userTypeBtn.titleLabel?.text)!)
        
        self.pushToOpportunityBoard()
        
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
    
    @IBAction func selectUserTypeBtnClicked(_ sender: UIButton) {
        self.pickerView.isHidden = false
    }
    

}



extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    //MARK: ------------------- UIPickerView Delegates  --------------------
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.text = pickerDataSource[row]
        pickerLabel.font = UIFont.openSans_14()
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.userTypeBtn.setTitle(pickerDataSource[row], for: .normal)
    }
    
    
    
}





