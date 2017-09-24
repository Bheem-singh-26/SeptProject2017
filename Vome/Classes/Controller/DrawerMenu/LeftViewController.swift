//
//  LeftViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit

enum LeftMenu: Int {
    
    case profile = 0
    case checkIn
    case myOpportunities
    case notification
    case inviteFriend
    case faq
    case setting
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController, LeftMenuProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var menuTitles = ["My Profile", "Check-in", "My Opportunities", "Notification", "Invite your friend", "FAQ", "Settings"]
    var menuImages = [#imageLiteral(resourceName: "UserIcon"), #imageLiteral(resourceName: "CheckInIcon"), #imageLiteral(resourceName: "Calender"), #imageLiteral(resourceName: "Notification"), #imageLiteral(resourceName: "Adduser"), #imageLiteral(resourceName: "FaqICon"), #imageLiteral(resourceName: "Settings")]
    var profileViewController: UIViewController!
    var checkInViewController: UIViewController!
    var goViewController: UIViewController!
    var imageHeaderView: ImageHeaderView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        
        let storyboard = getMainStoryBoard()
        let profileVC = storyboard.instantiateViewController(withIdentifier: StoryboardVCIdentifier.profile.rawValue) as! ProfileViewController
        self.profileViewController = UINavigationController(rootViewController: profileVC)
        
        let checkInVC = storyboard.instantiateViewController(withIdentifier: StoryboardVCIdentifier.checkIn.rawValue) as! CheckInViewController
        self.checkInViewController = UINavigationController(rootViewController: checkInVC)
        
//        let goViewController = storyboard.instantiateViewController(withIdentifier: "GoViewController") as! GoViewController
//        self.goViewController = UINavigationController(rootViewController: goViewController)
//        
//        let nonMenuController = storyboard.instantiateViewController(withIdentifier: "NonMenuController") as! NonMenuController
//        nonMenuController.delegate = self
//        self.nonMenuViewController = UINavigationController(rootViewController: nonMenuController)
//        
        self.tableView.registerCellNib(MenuTableViewCell.self)
        
        self.imageHeaderView = ImageHeaderView.loadNib()
        self.view.addSubview(self.imageHeaderView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.imageHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160)
        self.view.layoutIfNeeded()
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
            case .profile:
                self.slideMenuController()?.changeMainViewController(self.profileViewController, close: true)
            
            case .checkIn:
                self.slideMenuController()?.changeMainViewController(self.checkInViewController, close: true)
            
            default:
                break
        }
    }
    
}

extension LeftViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension LeftViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier()) as! MenuTableViewCell
        cell.selectionStyle = .none
        cell.cellTitle.text = menuTitles[indexPath.row]
        cell.cellImage.image = menuImages[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.changeViewController(LeftMenu(rawValue: indexPath.row)!)
    }
    
    
}
