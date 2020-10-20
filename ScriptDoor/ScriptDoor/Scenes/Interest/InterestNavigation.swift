//
//  InterestNavigation.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 15/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class InterestNavigation {
    
    // MARK: - Variables
    private let viewController: InterestViewController
    init(_ controller: InterestViewController) { viewController = controller  }
    
    // MARK: - Navigations
    func moveToProfile() {
        if let signUpVc = UIStoryboard.authontication.getViewController(type: ProfileViewController.self ) {
            viewController.navigationController?.pushViewController(signUpVc, animated: true)
        }
    }
    
    func moveToBusinessProfile() {
        if let signUpVc = UIStoryboard.authontication.getViewController(type: BusinessProfileViewController.self ) {
            viewController.navigationController?.pushViewController(signUpVc, animated: true)
        }
    }
    
    func backToSignUpAsAn() {
        viewController.navigationController?.popViewController(animated: true)
    }
}
