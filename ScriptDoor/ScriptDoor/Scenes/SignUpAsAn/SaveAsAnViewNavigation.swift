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
    
    func moveToEmail() {
        if let email = UIStoryboard.authontication.getViewController(type: EmailViewController.self)  {
            email.accountType = viewController.accountType
            viewController.navigationController?.pushViewController(email, animated: true)
        }
    }
}
