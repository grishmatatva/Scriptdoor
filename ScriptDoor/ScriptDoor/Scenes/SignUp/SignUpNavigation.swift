//
//  SignUpNavigation.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

final class SignUpNavigation {
    
    // MARK: - Variable
    var viewController: SignUpViewController
    init(_ controller: SignUpViewController) { viewController = controller }
    
    // MARK: - Navigations
    func moveToSignUpAs() {
        if let signUpAsVc = UIStoryboard.authontication.getViewController(type: SignUpAsAnViewController.self ) {
            viewController.navigationController?.pushViewController(signUpAsVc, animated: true)
        }
    }
}
