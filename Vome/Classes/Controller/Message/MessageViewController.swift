//
//  MessageViewController.swift
//  Vome
//
//  Created by Bheem Singh on 25/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = StringConstant.MESSAGE
        
        intializeView()

    }
    
    func intializeView(){
        
        tableView.registerCellNib(MessgaeTableViewCell.self)
        tableView.estimatedRowHeight = 70
        tableView.tableFooterView = UIView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}


extension MessageViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MessgaeTableViewCell.reuseIdentifier()) as! MessgaeTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
}

