//
//  OpportunityBoardViewController.swift
//  Vome
//
//  Created by Bheem Singh on 16/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class OpportunityBoardViewController: BaseViewController {

    //MARK: ------------------------ IBOutlets and Variables ---------------------
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentView: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: ------------------------ Default Mehtods -----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = StringConstant.PAYMENT_PLAN
        tableView.register(UINib(nibName: OpportunityBoardTableViewCell.reuseIdentifier(),bundle: nil), forCellReuseIdentifier: OpportunityBoardTableViewCell.reuseIdentifier())
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 130
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        
    }
    
    
}


extension OpportunityBoardViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: ------------------------ TableView Delegates -----------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: OpportunityBoardTableViewCell.reuseIdentifier()) as! OpportunityBoardTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
