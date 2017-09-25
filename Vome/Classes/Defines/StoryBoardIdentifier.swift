//
//  StoryBoardIdentifier.swift
//  Vome
//
//  Created by Bheem Singh on 16/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

//---------------- This class is used for all StoryBoards Identifers (SB)  in the the app ---------------------------------------

import Foundation
import UIKit

//Name should start with SB for Storyboard identifier

enum StoryboardNames: String {
    
    case main = "Main"
    case login = "Login"
    case chat = "Chat"

}



// ------------------------------- View Controller Identifier -----------------------

enum StoryboardVCIdentifier: String {

    case paymentPlan = "PaymentPlanViewController"
    case opportunityBoard = "OpportunityBoardViewController"
    case login = "LoginViewController"
    case home = "HomeViewController"
    case register = "RegisterViewController"
    case loginSignup = "LoginSignUpViewController"
    case profile = "ProfileViewController"
    case checkIn = "CheckInViewController"
    case message = "MessageViewController"
    
}




//MARK: ------------------------------ Get App StoryBoards  ------------------------------

func getMainStoryBoard() -> UIStoryboard {
    let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.main.rawValue, bundle: nil)
    return storyboard
}


func getLoginStoryBoard() -> UIStoryboard {
    let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.login.rawValue, bundle: nil)
    return storyboard
}

func getChatStoryBoard() -> UIStoryboard {
    let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.chat.rawValue, bundle: nil)
    return storyboard
}



