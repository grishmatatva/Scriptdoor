//
//  ChatStartGroupNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 07/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class ChatStartGroupNavigation {
    
    // MARK: - Variables
       private let viewController: ChatStartGroupViewController
       init(_ controller: ChatStartGroupViewController) { viewController = controller  }
       
       // MARK: - Navigations
    func moveToStartGroup(array: [InfoGroupChat]) {
           if let signUpVc = UIStoryboard.chat.getViewController(type: ChatDetailViewController.self ) {
            signUpVc.arrayDetail = array
               viewController.navigationController?.pushViewController(signUpVc, animated: true)
           }
       }
}
