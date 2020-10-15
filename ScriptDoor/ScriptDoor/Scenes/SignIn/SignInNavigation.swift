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
    func MoveToSignUp() {
        if let signUp = UIStoryboard.authontication.getViewController(type: SignUpViewController.self) {
        viewController.navigationController?.pushViewController(signUp, animated: true)
        }
    }
}
