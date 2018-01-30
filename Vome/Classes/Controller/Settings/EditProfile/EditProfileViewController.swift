//
//  EditProfileViewController.swift
//  Vome
//
//  Created by Bheem Singh on 26/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    //MARK: ------------------------ IBOutlets and Variables ---------------------
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var submitButton: UIButton!
    
    let userType = EnumUserType(rawValue: (AppUser.sharedInstance?.userType)!)
    
    let organizationFields = ["Description", "Phone", "Email", "Website url", "Address"]
    let volunteerFields = ["Description", "Gender", "Date of birth", "Interests", "Address", "Organization"]
    
    //MARK: ------------------------ Default Mehtods ----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = StringConstant.EDITPROFILE
        intializeView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func intializeView(){
        self.changeNaviagtionLeftItem()
        tableView.registerCellNib(EditProfileImageTableViewCell.self)
        tableView.registerCellNib(TextFieldTableViewCell.self)
        tableView.registerCellNib(EditDescriptionTableViewCell.self)
        tableView.estimatedRowHeight = 200
        tableView.separatorStyle = .none
        //fetchProfileDetails()
    }

    //MARK: ------------------------ Actions Mehtods ----------------------------
    
    @IBAction func submitButtonClicked(_ sender: UIButton) {
        
    }
    
    
    
}


extension EditProfileViewController: UITableViewDelegate, UITableViewDataSource{

    //MARK: ------------------------ TableView Delegates -----------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.userType! {
            case .organization, .school:
                return 6
            default:
                return 7
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: EditProfileImageTableViewCell.reuseIdentifier()) as! EditProfileImageTableViewCell
            cell.selectionStyle = .none
            
            return cell
        }
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: EditDescriptionTableViewCell.reuseIdentifier()) as! EditDescriptionTableViewCell
            cell.selectionStyle = .none
            cell.captionLabel.text = organizationFields[indexPath.row - 1]
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.reuseIdentifier()) as! TextFieldTableViewCell
        cell.selectionStyle = .none
        
        switch self.userType! {
        case .organization, .school:
            cell.captionLabel.text = organizationFields[indexPath.row - 1]
        default:
            cell.captionLabel.text = volunteerFields[indexPath.row - 1]
        }
        
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    
}










