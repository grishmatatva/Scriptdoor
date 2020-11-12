//
//  SaveAsAnViewNavigation.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 19/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
enum SignUpAs {
    case invidual
    case business
}

class SignUpAsAnViewNavigation {
    
    var viewController: SignUpAsAnViewController
    
    init(viewController: SignUpAsAnViewController) {
        self.viewController = viewController
    }
    
    func moveToInterest() {
        if let interest = UIStoryboard.authontication.getViewController(type: InterestViewController.self)  {
            interest.accountType = viewController.accountType
            viewController.navigationController?.pushViewController(interest, animated: true)
        }
    }
    
    func moveToExplore() {
        if let explore = UIStoryboard.landing.getViewController(type: TabbarViewController.self) {
            viewController.navigationController?.pushViewController(explore, animated: true)
        }
    }

}
