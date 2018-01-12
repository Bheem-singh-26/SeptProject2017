//
//  OpportunityBoardViewController.swift
//  Vome
//
//  Created by Bheem Singh on 16/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit
import SVProgressHUD
import SlideMenuControllerSwift

class OpportunityBoardViewController: BaseViewController {

    //MARK: ------------------------ IBOutlets and Variables ---------------------
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentView: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var opportunityPost:OpportunityPosts?
    
    
    //MARK: ------------------------ Default Mehtods -----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = StringConstant.OPPORTUNITY_BOARD
        
        intializeView()
        fetchOpportunityPosts()
        
    }
    
    func intializeView(){
        
        tableView.registerCellNib(OpportunityBoardTableViewCell.self)
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 130
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchOpportunityPosts() {
        
        SVProgressHUD.show()
        APImanager.opportunityPosts(apiService: .opportunityBoardPostList) { (posts, errorObject) in
            
            SVProgressHUD.dismiss()
            if isGuardObject(posts){
                self.opportunityPost = posts
                self.tableView.reloadData()
            }else{
                print("Opportunity failed !!!!!!!")
            }
        }
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        
        self.tableView.reloadData()
    }
    
    
}


extension OpportunityBoardViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: ------------------------ TableView Delegates -----------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.segmentView.selectedSegmentIndex == 1 {
            if let posts = self.opportunityPost {
                return posts.pledgeCount!
            }
        }else {
            if let posts = self.opportunityPost {
                return posts.oneTimerCount!
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: OpportunityBoardTableViewCell.reuseIdentifier()) as! OpportunityBoardTableViewCell
        cell.selectionStyle = .none
        
        if self.segmentView.selectedSegmentIndex == 1 {
            cell.post = self.opportunityPost?.pledgePostList?[indexPath.row]
            
        }else {
            cell.post = self.opportunityPost?.oneTimerPostList?[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        pushToPaymentPlan()
        
    }
    
}


























