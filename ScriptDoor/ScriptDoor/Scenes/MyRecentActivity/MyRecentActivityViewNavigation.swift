//
//  MyRecentActivityViewNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class MyRecentActivityViewNavigation {
    
    // MARK: - Variable
    var viewController: MyRecentActivityViewController
    
    init(viewController: MyRecentActivityViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Navigation Methods
    func moveToRequest() {
        if let request = UIStoryboard.profile.getViewController(type: ProfileRequestViewController.self) {
           viewController.present(request, animated: true, completion: nil)
        }
        
    }
    
    func backToInterest() {
            viewController.navigationController?.popViewController(animated: true)
    }
}
