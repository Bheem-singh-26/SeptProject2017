//
//  MyOpportunityViewController.swift
//  Vome
//
//  Created by Sonia Yadav on 15/03/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import UIKit
import SVProgressHUD

class MyOpportunityViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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
               // self.opportunityPost = posts
                self.tableView.reloadData()
            }else{
                print("Opportunity failed !!!!!!!")
            }
        }
    }
    
   
    
    
}


extension MyOpportunityViewController:PushToBookNow{
    
    func bookNowButtonClicked(cell: OpportunityBoardTableViewCell) {
       
    }
    
}


extension MyOpportunityViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: ------------------------ TableView Delegates -----------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: OpportunityBoardTableViewCell.reuseIdentifier()) as! OpportunityBoardTableViewCell
        cell.selectionStyle = .none
        cell.delegate = self
        
//        if self.segmentView.selectedSegmentIndex == 1 {
//            cell.post = self.opportunityPost?.pledgePostList?[indexPath.row]
//
//        }else {
//            cell.post = self.opportunityPost?.oneTimerPostList?[indexPath.row]
//        }
//
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }

}
