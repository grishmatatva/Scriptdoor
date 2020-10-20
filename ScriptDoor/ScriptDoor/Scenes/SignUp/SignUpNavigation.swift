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
    func moveToEmail() {
        if let signUpAsVc = UIStoryboard.authontication.getViewController(type: EmailViewController.self ) {
            viewController.navigationController?.pushViewController(signUpAsVc, animated: true)
        }
    }
    
    func moveToSignIn() {
            if viewController.navigationController?.viewController(ofClass: SignInViewController.self) ?? false{
                viewController.navigationController?.pop(transitionType: .push)
            } else {
                if  let signUpVc = UIStoryboard.authontication.getViewController(type: SignInViewController.self) {
                    
                    viewController.navigationController?.pushViewController(signUpVc, animated: true)
                }
            }
    }
    
    func backToWelcome() {
        viewController.navigationController?.popToViewController(viewController: WelcomeViewController.self)
    }
}
