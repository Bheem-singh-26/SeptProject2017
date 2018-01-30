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
import DropDown

class OpportunityBoardViewController: BaseViewController {

    //MARK: ------------------------ IBOutlets and Variables ---------------------
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentView: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var opportunityPost:OpportunityPosts?
    
    let dropDown = DropDown()
    
    @IBOutlet weak var selectCityButton: UIButton!
    
    let dropDownDataSource = ["Montreal", "Ottawa", "Toronto"]

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
        selectCityButton.addBorder(borderWidth: 1, color: UIColor.white)
    
        initializeDropDown()
    }

    func initializeDropDown(){
        
        // The view to which the drop down will appear on
        dropDown.anchorView = self.selectCityButton // UIView or UIBarButtonItem
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        DropDown.appearance().textColor = UIColor.black
        DropDown.appearance().textFont = UIFont.openSans_14()
        DropDown.appearance().backgroundColor = UIColor.white
        DropDown.appearance().selectionBackgroundColor = UIColor.lightGray
        //DropDown.appearance().cellHeight = 60
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = dropDownDataSource
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.selectCityButton.setTitle(self.dropDownDataSource[index], for: .normal)
        }
        
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
    @IBAction func SelectCityBtnClicked(_ sender: UIButton) {
        self.dropDown.show()
    }
    
    
}


extension OpportunityBoardViewController:PushToBookNow{
    
    func bookNowButtonClicked(cell: OpportunityBoardTableViewCell) {
        let indexPath = self.tableView.indexPath(for: cell)
        if self.segmentView.selectedSegmentIndex == 1 {
            let eventId = self.opportunityPost?.pledgePostList?[(indexPath?.row)!].id
            pushToAddBooking(eventId: eventId!)
        }else {
            let eventId = self.opportunityPost?.oneTimerPostList?[(indexPath?.row)!].id
            pushToAddBooking(eventId: eventId!)
        }
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
        cell.delegate = self
        
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




