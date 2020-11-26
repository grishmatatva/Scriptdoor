//
//  MyRecentActivityViewNavigator.swift
//  ScriptDoor
//
//  Created by PCQ187 on 26/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class MyRecentActivityViewNavigator {
    
    // MARK: - Variables
    let viewController: MyRecentActivityViewController
    
    init(viewController: MyRecentActivityViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Navigation
    func moveToAdd() {
        if let explore = UIStoryboard.authontication.getViewController(type: InterestViewController.self) {
            viewController.navigationController?.pushViewController(explore, animated: true)
        }
    }
}
