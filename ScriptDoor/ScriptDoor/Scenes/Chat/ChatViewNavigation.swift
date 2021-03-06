//
//  ChatViewNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 02/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

final class  ChatViewNavigation {
    
    // MARK: - Variables
    private let viewController: ChatViewController
    init(_ controller: ChatViewController) { viewController = controller  }
    
    // MARK: - Navigations
    func moveToGroup() {
        if let groupChatVc = UIStoryboard.chat.getViewController(type: ChatGroupViewController.self ) {
            viewController.navigationController?.pushViewController(groupChatVc, animated: true)
        }
    }
    
    func moveToChat() {
        if let messageVc = UIStoryboard.chat.getViewController(type: MessageViewController.self ) {
            viewController.navigationController?.pushViewController(messageVc, animated: true)
        }
    }
}
