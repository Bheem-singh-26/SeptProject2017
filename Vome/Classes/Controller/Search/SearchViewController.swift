//
//  SearchViewController.swift
//  Vome
//
//  Created by Bheem Singh on 17/03/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit
import SVProgressHUD

class SearchViewController: UIViewController {
    
    //MARK: ------------------------ IBOutlets and Variables ---------------------
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var usersArray = [SearchUser]()
    
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
        self.navigationController?.navigationBar.isHidden = true
        tableView.registerCellNib(SearchTableViewCell.self)
        self.tableView.tableFooterView = UIView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func fetchSearchResultfrom(searchTxt: String){
        SVProgressHUD.show()
        APImanager.searchUser(apiService: .searchUser(text: searchTxt)) { (users, error) in
            SVProgressHUD.dismiss()
            if isGuardObject(users){
                self.usersArray = users!
                self.tableView.reloadData()
            }else{
                print("search result failed!!")
            }
        }
        
    }
    
    //MARK: ------------------------ Actions Mehtods ----------------------------
    
    
}


extension SearchViewController: UISearchBarDelegate{
    
    //MARK: ------------------------ UISearchBar delegates ---------------------

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.navigationController?.navigationBar.isHidden = false
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.fetchSearchResultfrom(searchTxt: searchBar.text!)
    }
    
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: ------------------------ UITableView delegates ---------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier()) as! SearchTableViewCell
        cell.selectionStyle = .none
        
        if let usertype = usersArray[indexPath.row].userType{
            let userType = EnumUserType(rawValue: usertype)
            switch userType! {
            case .organization, .school:
                cell.userType.text = userType?.valueOf()
            default:
                cell.userType.text = userType?.valueOf()
            }
        }else{
            cell.userType.text = "Volunteer"
        }
        cell.searchUser = self.usersArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let userType = EnumUserType(rawValue: usersArray[indexPath.row].userType!){
            self.navigationController?.navigationBar.isHidden = false
            switch userType {
            case .organization, .school:
                pushToOrganizationProfile(userId: usersArray[indexPath.row].id!, iscomingFromSearch: true)
            default:
                pushToVolunteerProfile(userId: usersArray[indexPath.row].id!, iscomingFromSearch: true)
            }
        }
    }
    
}





