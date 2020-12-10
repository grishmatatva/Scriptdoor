//
//  ProfileRequestViewNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import Foundation

class ProfileRequestViewNavigation {
    
    // MARK: - Variable
    var viewController: ProfileRequestViewController
    
    init(viewController: ProfileRequestViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Navigation Methods
    func backToRequest() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
