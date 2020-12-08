//
//  MessageViewNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 08/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import Foundation

class MessageViewNagiation {
    
    var viewController: MessageViewController
    
    init(viewController: MessageViewController) {
        self.viewController = viewController
    }
    
    func backToChat() {
        viewController.navigationController?.popViewController(animated: true)
    }
}
