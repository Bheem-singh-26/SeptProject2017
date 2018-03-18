//
//  VolunteerProfileViewController.swift
//  Vome
//
//  Created by Bheem Singh on 14/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit
import SVProgressHUD

class VolunteerProfileViewController: BaseViewController {
    
    //MARK: ------------------------ IBOutlets and Variables ---------------------
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var profileDetails: ProfileResponse?
    
    var dataSourceImage = [#imageLiteral(resourceName: "AboutIcon"), #imageLiteral(resourceName: "GenderIcon"), #imageLiteral(resourceName: "CakeIcon"), #imageLiteral(resourceName: "Briefcase"), #imageLiteral(resourceName: "InterestIcon"), #imageLiteral(resourceName: "Marker"), #imageLiteral(resourceName: "OrganizationIcon"), #imageLiteral(resourceName: "SendMessageIcon")]
    
    
    // For search users profile
    var userID: String?
    var isComingFromSearch = false
    
    //MARK: ------------------------ Default Mehtods ----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        intializeView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func intializeView(){
        
        tableView.registerCellNib(VolunteerProfileTableViewCell.self)
        tableView.registerCellNib(TextWithIconTableViewCell.self)
        tableView.registerCellNib(HoursProgressTableViewCell.self)
        tableView.estimatedRowHeight = 200
        if isComingFromSearch{
            removeNavigationBarItem()
            changeNaviagtionLeftItem()
        }
        fetchProfileDetails()
    }
    
    func fetchProfileDetails(){
        var userId = ""
        isComingFromSearch ? (userId = self.userID!) : (userId = (AppUser.sharedInstance?.id)!)
        
        SVProgressHUD.show()
        APImanager.profileDetails(apiService: .profileDetails(userId: userId)) { (details, errorMsg) in
            SVProgressHUD.dismiss()
            if isGuardObject(details){
                self.profileDetails = details
                self.title = (self.profileDetails?.firstName?.capitalized)! + StringConstant.PROFILE
                self.tableView.reloadData()
            }else{
                print("Fetch profile details failed !!!!!!!")
            }
        }
    }
    
    //MARK: ------------------------ Actions Mehtods ----------------------------
    
    @IBAction func followButtonClicked(_ sender: UIButton) {
        
    }
    
    
    
}




extension VolunteerProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: ------------------------ UITableView delegates ---------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = self.profileDetails{
            return self.dataSourceImage.count + 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: VolunteerProfileTableViewCell.reuseIdentifier()) as! VolunteerProfileTableViewCell
            cell.selectionStyle = .none
            cell.userName.text = (self.profileDetails?.firstName?.capitalized)! + " " + (self.profileDetails?.lastName?.capitalized)!
            cell.userImage.setImageFrom(url: self.profileDetails?.profileImageUrl, placeHolder: #imageLiteral(resourceName: "UserIcon"))
            
            return cell
        }
        if indexPath.row == dataSourceImage.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: HoursProgressTableViewCell.reuseIdentifier()) as! HoursProgressTableViewCell
            cell.selectionStyle = .none
            if let verifiedTotalHours = self.profileDetails?.verifiedTotalHours{
                cell.completedHourCount.text = String(verifiedTotalHours)
            }else{
                cell.completedHourCount.text = "0"
            }
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TextWithIconTableViewCell.reuseIdentifier()) as! TextWithIconTableViewCell
        cell.selectionStyle = .none
        
        switch indexPath.row{
            case 1:
                if let descriptionStr = self.profileDetails?.description{
                    cell.labelTextStrig = descriptionStr
                }else{
                    cell.labelTextStrig = "Description:\nMost storms have caught me by surprise, so I had to learn very quickly to look further and understand that I am not capable of controlling the weather."
                }
            case 2:
                if let gender = self.profileDetails?.gender, gender != ""{
                    cell.labelTextStrig = gender
                }else{
                    cell.labelTextStrig = "Male"
                }
            case 3:
                if let dateOfBirth = self.profileDetails?.dateOfBirth{
                    cell.labelTextStrig = dateOfBirth
                }else{
                    cell.labelTextStrig = "26 April, 1991"
                }
            
            case 4:
                cell.labelTextStrig = self.profileDetails?.userType
            case 5:
                var interestStr = ""
                if let interests = self.profileDetails?.interests{
                    for (index,interest) in interests.enumerated(){
                        if index == 0{
                            interestStr += interest.name!
                        }else{
                            interestStr += ", " + interest.name!
                        }
                    }
                }
                cell.labelTextStrig = "Interests:  " + interestStr
            case 6:
                if let city = self.profileDetails?.city, let provinceState = self.profileDetails?.provinceState, let country = self.profileDetails?.country{
                    cell.labelTextStrig = city + ", " + provinceState + ", " + country
                }else{
                    cell.labelTextStrig = "Montreal, Quebec, Canada"
                }
            case 7:
                cell.labelTextStrig = (self.profileDetails?.firstName)! + "'s Organizations"
            
            default:
                break
        }
        
        cell.imageIcon.image = dataSourceImage[indexPath.row - 1]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == dataSourceImage.count{
            return 125
        }
        return UITableViewAutomaticDimension
    }
    
}




