//
//  ChatDetailNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 08/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class ChatDetailNavigation {
    
    var viewController: ChatDetailViewController
    
    init(viewController: ChatDetailViewController) {
        self.viewController = viewController
    }
    
    func backToChat() {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func backToCreate() {
        if let ChatDetailVc = UIStoryboard.chat.getViewController(type: MessageViewController.self) {
            viewController.navigationController?.pushViewController(ChatDetailVc, animated: true)
        }
    }
}
