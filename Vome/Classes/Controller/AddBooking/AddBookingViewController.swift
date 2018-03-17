//
//  AddBookingViewController.swift
//  Vome
//
//  Created by Puneet JR on 14/01/18.
//  Copyright © 2018 Bheem Singh. All rights reserved.
//

import Foundation
import SVProgressHUD
import SlideMenuControllerSwift
import DropDown

class AddBookingViewController: UIViewController {
    
    //MARK: ------------------------ IBOutlets and Variables ---------------------
    
    @IBOutlet weak var dateLabelButton: UIButton!
    @IBOutlet weak var fromTimeButton: UIButton!
    @IBOutlet weak var toTimeButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    var eventDetails: EventDetails?
    var eventDates = [EventDate]()
    var eventId:String?
    
    var visibleDateSlots = [String]()
    var fromTimeSlots = [String]()
    var toTimeSlots = [String]()
    var visibleFromTimeSlots = [String]()
    var visibleToTimeSlots = [String]()
    
    let dropDown1 = DropDown()
    let dropDown2 = DropDown()
    let dropDown3 = DropDown()
    
    //MARK: ------------------------ Default Mehtods -----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = StringConstant.ADDBOOKING
        // Do any additional setup after loading the view.
        intializeView()
    }
    
    func intializeView(){
        
        self.changeNaviagtionLeftItem()
        self.cancelButton.addBorder(borderWidth: 1, color: UIColor.themeGreenColor())
        self.dateLabelButton.addBorder(borderWidth: 1, color: UIColor.themeGrayColor())
        self.fromTimeButton.addBorder(borderWidth: 1, color: UIColor.themeGrayColor())
        self.toTimeButton.addBorder(borderWidth: 1, color: UIColor.themeGrayColor())
        
        fetchTimeSlots()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: ------------------------ Custom Mehtods -----------------------
    
    func initializeDropDown(){
        
        // The view to which the drop down will appear on
        dropDown1.anchorView = self.dateLabelButton // UIView or UIBarButtonItem
        dropDown1.bottomOffset = CGPoint(x: 0, y:(dropDown1.anchorView?.plainView.bounds.height)!)
        dropDown1.dataSource = self.visibleDateSlots
        dropDown2.anchorView = self.fromTimeButton // UIView or UIBarButtonItem
        dropDown2.bottomOffset = CGPoint(x: 0, y:(dropDown1.anchorView?.plainView.bounds.height)!)
        dropDown2.dataSource = self.fromTimeSlots
        dropDown3.anchorView = self.toTimeButton // UIView or UIBarButtonItem
        dropDown3.bottomOffset = CGPoint(x: 0, y:(dropDown1.anchorView?.plainView.bounds.height)!)
        dropDown3.dataSource = self.toTimeSlots
        
        DropDown.appearance().textColor = UIColor.black
        DropDown.appearance().textFont = UIFont.openSans_14()
        DropDown.appearance().backgroundColor = UIColor.white
        DropDown.appearance().selectionBackgroundColor = UIColor.lightGray
        
        // Action triggered on selection
        dropDown1.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.dateLabelButton.setTitle(self.visibleDateSlots[index], for: .normal)
            self.changeFromAndToDate(date: self.visibleDateSlots[index])
        }
        dropDown2.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.fromTimeButton.setTitle(self.visibleFromTimeSlots[index], for: .normal)
        }
        dropDown3.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.toTimeButton.setTitle(self.visibleToTimeSlots[index], for: .normal)
        }
        
    }
    
    func getDatasourceForDropdown(){
        
        self.eventDates = self.eventDates.sorted (by: {$0.date! < $1.date!})
        var lastDate = self.eventDates[0].date
        self.visibleDateSlots.append(self.getDateSubstring(str: lastDate!))
        for eventDate in self.eventDates{
            if lastDate == eventDate.date{
                self.fromTimeSlots.append(eventDate.startHour!)
                self.toTimeSlots.append(eventDate.endHour!)
            }else{
                lastDate = eventDate.date
                self.visibleDateSlots.append(self.getDateSubstring(str: (eventDate.date)!))
                self.fromTimeSlots.append(eventDate.startHour!)
                self.toTimeSlots.append(eventDate.endHour!)
            }
        
        }
        
    }
    
    func getDateSubstring(str:String) -> String{
        let index = str.index(str.startIndex, offsetBy: 10)
        let mySubstring = str.substring(to: index)
        return mySubstring
    }
    
    func changeFromAndToDate(date:String){
        self.visibleFromTimeSlots.removeAll()
        self.visibleToTimeSlots.removeAll()
        for fromDate in self.fromTimeSlots{
            if fromDate.contains(date){
                let time = self.getTimeSubstring(str: fromDate)
                if !self.visibleToTimeSlots.contains(time){
                    self.visibleFromTimeSlots.append(time)
                }
            }
        }
        for toDate in self.toTimeSlots{
            if toDate.contains(date){
                let time = self.getTimeSubstring(str: toDate)
                if !self.visibleToTimeSlots.contains(time){
                    self.visibleToTimeSlots.append(time)
                }
            }
        }
        dropDown2.dataSource = self.visibleFromTimeSlots
        dropDown3.dataSource = self.visibleToTimeSlots
        
    }
    
    func getTimeSubstring(str:String) -> String{
        
        let start = str.index(str.startIndex, offsetBy: 11)
        let end = str.index(str.endIndex, offsetBy: -3)
        let range = start..<end
        let mySubstring = str.substring(with: range)
        return mySubstring
    }
    
    func removeOldDataSource(){
        self.fromTimeSlots.removeAll()
        self.toTimeSlots.removeAll()
    }
    
    func fetchTimeSlots(){
        
        SVProgressHUD.show()
        APImanager.opportunityDetailView(apiService: .opportunityDetailView(id: self.eventId!)) { (details, errObject) in
            SVProgressHUD.dismiss()
            if isGuardObject(details){
                self.eventDetails = details
                self.eventDates = (self.eventDetails?.eventDates)!
                self.removeOldDataSource()
                self.getDatasourceForDropdown()
                self.initializeDropDown()
                
            }else{
                print("Opportunity detail view failed !!!!!!!")
            }
        }
        
    }
    
    //MARK: ------------------------ Actions -----------------------
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmButtonClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func selectDateButtonClicked(_ sender: UIButton) {
        self.dropDown1.show()
    }
    
    @IBAction func fromTimeButtonClicked(_ sender: UIButton) {
        self.dropDown2.show()
    }

    @IBAction func toTimeButtonClicked(_ sender: UIButton) {
        self.dropDown3.show()
    }
    
    
    
}

