//
//  EmailViewNavigation.swift
//  ScriptDoor
//
//  Created by PCQ185 on 10/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import Foundation

import UIKit

final class EmailViewNavigation {
    
    // MARK: - Variables
    private let viewController: EmailViewController
    init(_ controller: EmailViewController) { viewController = controller  }
    
    // MARK: - Navigations
    func moveToProfile() {
        if let signUpVc = UIStoryboard.authontication.getViewController(type: ProfileViewController.self ) {
            viewController.navigationController?.pushViewController(signUpVc, animated: true)
        }
    }
}
