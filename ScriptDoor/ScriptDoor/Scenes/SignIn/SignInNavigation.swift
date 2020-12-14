//
//  SignInNavigation.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 15/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class SignInNavigation {
    
    // MARK: - Variables
    let viewController: SignInViewController
    
    init(viewController: SignInViewController) {
        self.viewController = viewController
    }
}

extension SignInNavigation {
    
    // MARK: - Method
    func moveToSignUp() {
        if viewController.navigationController?.viewController(ofClass: SignUpViewController.self) ?? false{
            viewController.navigationController?.pop(transitionType: .push)
        } else {
            if  let signUpVc = UIStoryboard.authontication.getViewController(type: SignUpViewController.self) {
                
                viewController.navigationController?.pushViewController(signUpVc, animated: true)
            }
        }
    }
    
    func moveToExplore() {
        if let explore = UIStoryboard.landing.getViewController(type: TabbarViewController.self) {
            viewController.navigationController?.pushViewController(explore, animated: true)
        }
    }
}

