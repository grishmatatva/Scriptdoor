//
//  WelcomeViewNavigator.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

final class WelcomeViewNavigator {
    
    // MARK: - Variable
    var viewController: WelcomeViewController
    init(_ controller: WelcomeViewController) { viewController = controller }
    
    // MARK: - Navigations
    func moveToSignUp() {
        if let signUpAsVc = UIStoryboard.authontication.getViewController(type: SignUpViewController.self ) {
            viewController.navigationController?.pushViewController(signUpAsVc, animated: true)
        }
    }
    
    func moveToSignIn() {
        if let signUpAsVc = UIStoryboard.authontication.getViewController(type: SignInViewController.self ) {
            viewController.navigationController?.pushViewController(signUpAsVc, animated: true)
        }
    }
}
