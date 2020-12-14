//
//  ProfileHeaderViewNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 26/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class ProfileHeaderViewNavigation {
    
    // MARK: - Variables
    let viewController: ProfileHeaderViewController
    
    init(viewController: ProfileHeaderViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Navigation
    func moveToAdd() {
        if let explore = UIStoryboard.authontication.getViewController(type: InterestViewController.self) {
            viewController.navigationController?.pushViewController(explore, animated: true)
        }
    }
    
    func moveToEditProfile() {
        if let explore = UIStoryboard.profile.getViewController(type: EditProfileViewController.self) {
            viewController.navigationController?.pushViewController(explore, animated: true)
        }
    }
}
