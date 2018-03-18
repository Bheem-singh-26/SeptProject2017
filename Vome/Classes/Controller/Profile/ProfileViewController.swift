//
//  ProfileViewController.swift
//  Vome
//
//  Created by Bheem Singh on 24/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProfileViewController: BaseViewController {

    //MARK: ------------------------ IBOutlets and Variables ---------------------
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var dataSource = ["Description:\nI have seen many storms in my life. Most storms have caught me by surprise, so I had to learn very quickly to look further and understand that I am not capable of controlling the weather, to exercise the art of patience and to respect the fury of nature.", "+91-9865637807", "Samuel@gmail.com", "www.samuel@gmail.ua", "Montreal, Quebec, Canada", "User Type: Organization"]
    var dataSourceImage = [#imageLiteral(resourceName: "NewsIcon"), #imageLiteral(resourceName: "PhoneIcon"), #imageLiteral(resourceName: "MailIcon"), #imageLiteral(resourceName: "WebIcon"), #imageLiteral(resourceName: "Marker"), #imageLiteral(resourceName: "Briefcase")]
    
    var profileDetails: ProfileResponse?
    
    // For search users profile
    var userID: String?
    var isComingFromSearch = false
    
    //MARK: ------------------------ Default Mehtods ----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = StringConstant.ORGANIZATION_PROFILE
        
        intializeView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func intializeView(){
        
        tableView.registerCellNib(ProfileMapTableViewCell.self)
        tableView.registerCellNib(TextWithIconTableViewCell.self)
        tableView.registerCellNib(ProfileViewTableViewCell.self)
        tableView.estimatedRowHeight = 200
        if isComingFromSearch{
            removeNavigationBarItem()
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




extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: ------------------------ UITableView delegates ---------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = self.profileDetails{
            return self.dataSourceImage.count + 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileViewTableViewCell.reuseIdentifier()) as! ProfileViewTableViewCell
            cell.selectionStyle = .none
            cell.userName.text = (self.profileDetails?.name?.capitalized)
            cell.userImage.setImageFrom(url: self.profileDetails?.profileImageUrl, placeHolder: #imageLiteral(resourceName: "UserIcon"))
            
            return cell
        }
        
        if indexPath.row == dataSourceImage.count + 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMapTableViewCell.reuseIdentifier()) as! ProfileMapTableViewCell
            cell.selectionStyle = .none
            if let followOrganisations = self.profileDetails?.followOrganisations?.count{
                cell.followingCount.text = "\(followOrganisations)"
            }else{
                cell.followingCount.text = "0"
            }
            if let opportunityPublished = self.profileDetails?.opportunityPublished{
                cell.opportunityCount.text = "\(opportunityPublished)"
            }else{
                cell.opportunityCount.text = "0"
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
            if let phoneNumber = self.profileDetails?.phoneNumber{
                cell.labelTextStrig = phoneNumber
            }else{
                cell.labelTextStrig = "+919540842470"
            }
        case 3:
            if let email = self.profileDetails?.email{
                cell.labelTextStrig = email
            }else{
                cell.labelTextStrig = "Samuel@gmail.com"
            }
            
        case 4:
            if let website = self.profileDetails?.website{
                cell.labelTextStrig = website
            }else{
                cell.labelTextStrig = "www.samuel@gmail.ua"
            }
        case 5:
            
            if let city = self.profileDetails?.city, let provinceState = self.profileDetails?.provinceState, let country = self.profileDetails?.country{
                cell.labelTextStrig = city + ", " + provinceState + ", " + country
            }else{
                cell.labelTextStrig = "Montreal, Quebec, Canada"
            }
        case 6:
            cell.labelTextStrig = self.profileDetails?.userType
        default:
            break
        }
        
        cell.imageIcon.image = dataSourceImage[indexPath.row - 1]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == dataSource.count + 1{
            return 320
        }
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushToEditProfile()
    }
    
}




