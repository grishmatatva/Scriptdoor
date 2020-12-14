//
//  SettingViewNavigator.swift
//  ScriptDoor
//
//  Created by PCQ187 on 14/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class SettingViewNavigator {
    
    // MARK: - Variables
    let viewController: SettingsViewController
    
    init(viewController: SettingsViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Navigation
    func backFromSettings() {
        viewController.navigationController?.popViewController(animated: true)
    }
}

