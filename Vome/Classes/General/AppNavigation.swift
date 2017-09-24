//
//  AppNavigation.swift
//  Vome
//
//  Created by Bheem Singh on 16/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import Foundation
import UIKit
import SlideMenuControllerSwift

extension UIViewController{

    func popToRootViewController() {
        _ = self.navigationController?.popToRootViewController(animated: false)
    }
    
    func popViewController() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func removeNavigationBackButtonTitle(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    func pushToLoginVC() {
        let viewController = getLoginStoryBoard().instantiateViewController(withIdentifier: StoryboardVCIdentifier.login.rawValue) as! LoginViewController
        self.present(viewController, animated: true) { }
    }
    
    func pushToRegisterVC() {
        let viewController = getLoginStoryBoard().instantiateViewController(withIdentifier: StoryboardVCIdentifier.register.rawValue) as! RegisterViewController
        self.present(viewController, animated: true) { }
    }
    
    func pushToPaymentPlan() {
        let viewController = getMainStoryBoard().instantiateViewController(withIdentifier: StoryboardVCIdentifier.paymentPlan.rawValue) as! PaymentPlanViewController
        removeNavigationBackButtonTitle()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushToOpportunityBoard() {
        let viewController = getMainStoryBoard().instantiateViewController(withIdentifier: StoryboardVCIdentifier.opportunityBoard.rawValue) as! OpportunityBoardViewController
        removeNavigationBackButtonTitle()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func pushToDrawerMenu(){
        
        let storyboard = getMainStoryBoard()
        let mainViewController = storyboard.instantiateViewController(withIdentifier: StoryboardVCIdentifier.opportunityBoard.rawValue) as! OpportunityBoardViewController
        let leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        UINavigationBar.appearance().tintColor = UIColor.themeBlackColor()
        
        let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = slideMenuController
    }
    
    
}
