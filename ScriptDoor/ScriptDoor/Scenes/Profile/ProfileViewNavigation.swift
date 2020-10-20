//
//  ProfileViewNavigation.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 19/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
 
class ProfileViewNavigation {
    
    // MARK: - Variable
    var viewController: ProfileViewController
    
    init(viewController: ProfileViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Navigation Methods
    func moveToExplore() {
        if let explore = UIStoryboard.landing.getViewController(type: LandingViewController.self) {
            viewController.navigationController?.pushViewController(explore, animated: true)
        }
    }
    
    func backToInterest() {
            viewController.navigationController?.popViewController(animated: true)
    }
}
