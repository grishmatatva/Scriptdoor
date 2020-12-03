//
//  ChatGroupNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 02/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

final class  ChatGroupNavigation {
    
    // MARK: - Variables
    private let viewController: ChatGroupViewController
    init(_ controller: ChatGroupViewController) { viewController = controller  }
    
    // MARK: - Navigations
    func moveToStartGroup() {
        if let signUpVc = UIStoryboard.chat.getViewController(type: ChatStartGroupViewController.self ) {
            viewController.navigationController?.pushViewController(signUpVc, animated: true)
        }
    }
}
