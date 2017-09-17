//
//  PaymentPlanViewController.swift
//  Vome
//
//  Created by Bheem Singh on 10/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class PaymentPlanViewController: BaseViewController {
    
    //MARK: ------------------------ IBOutlets and Variables ---------------------

    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = ["Access to Opportunity Board","Filter to Search Optimization","Search Bar","Data Tracking","Vome Transcript"]
    let headerData = ["STANDARD", "VERIFIED"]
    let btnTitles = ["SELECT THE PLAN", "TRY IT FREE"]
    
    //MARK: ------------------------ Default Mehtods -----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = StringConstant.PAYMENT_PLAN
        let nib = UINib(nibName: PaymentPlanSectionHearder.reuseIdentifier(), bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: PaymentPlanSectionHearder.reuseIdentifier())
        tableView.register(UINib(nibName: TextWithIconTableViewCell.reuseIdentifier(),bundle: nil), forCellReuseIdentifier: TextWithIconTableViewCell.reuseIdentifier())
        tableView.register(UINib(nibName: OutlineButtonTableViewCell.reuseIdentifier(),bundle: nil), forCellReuseIdentifier: OutlineButtonTableViewCell.reuseIdentifier())
        tableView.estimatedRowHeight = 41
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}


extension PaymentPlanViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: ------------------------ TableView Delegates -----------------------
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.headerData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == dataSource.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: OutlineButtonTableViewCell.reuseIdentifier()) as! OutlineButtonTableViewCell
            cell.selectionStyle = .none
            cell.cellTitle.text = dataSource[indexPath.section]
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: TextWithIconTableViewCell.reuseIdentifier()) as! TextWithIconTableViewCell
        cell.selectionStyle = .none
        cell.cellTextLabel.text = dataSource[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Dequeue with the reuse identifier
        let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: PaymentPlanSectionHearder.reuseIdentifier())
        let header = cell as! PaymentPlanSectionHearder
        header.headerLabel.text = self.headerData[section]
        return header
    
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushToOpportunityBoard()
    }
    
}




