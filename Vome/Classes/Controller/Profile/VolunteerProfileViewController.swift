//
//  VolunteerProfileViewController.swift
//  Vome
//
//  Created by Bheem Singh on 14/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit

class VolunteerProfileViewController: BaseViewController {
    
    //MARK: ------------------------ IBOutlets and Variables ---------------------
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var dataSource = ["Description:\nI have seen many storms in my life. Most storms have caught me by surprise, so I had to learn very quickly to look further and understand that I am not capable of controlling the weather, to exercise the art of patience and to respect the fury of nature.", "+91-9865637807", "Samuel@gmail.com", "www.samuel@gmail.ua", "Montreal, Quebec, Canada", "User Type: Organization"]
    var dataSourceImage = [#imageLiteral(resourceName: "NewsIcon"), #imageLiteral(resourceName: "PhoneIcon"), #imageLiteral(resourceName: "MailIcon"), #imageLiteral(resourceName: "WebIcon"), #imageLiteral(resourceName: "Marker"), #imageLiteral(resourceName: "Briefcase")]
    
    //MARK: ------------------------ Default Mehtods ----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = StringConstant.PROFILE
        
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
        
    }
    
    func fetchProfileDetails(){
    
        
    }
    
    //MARK: ------------------------ Actions Mehtods ----------------------------
    
    @IBAction func followButtonClicked(_ sender: UIButton) {
        
    }
    
    
    
}




extension VolunteerProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileViewTableViewCell.reuseIdentifier()) as! ProfileViewTableViewCell
            cell.selectionStyle = .none
            
            return cell
        }
        if indexPath.row == dataSource.count + 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMapTableViewCell.reuseIdentifier()) as! ProfileMapTableViewCell
            cell.selectionStyle = .none
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TextWithIconTableViewCell.reuseIdentifier()) as! TextWithIconTableViewCell
        cell.selectionStyle = .none
        cell.cellTextLabel.text = dataSource[indexPath.row - 1]
        cell.cellTextLabel.sizeToFit()
        cell.cellTextLabel.textAlignment = .left
        
        cell.cellTextLabel.font = UIFont.openSans_14()
        cell.imageIcon.image = dataSourceImage[indexPath.row - 1]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == dataSource.count + 1{
            return 320
        }
        return UITableViewAutomaticDimension
    }
    
}
