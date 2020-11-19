//
//  GiftPublicationNavigator.swift
//  ScriptDoor
//
//  Created by PCQ187 on 17/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
//import SJSegmentedScrollView

class GiftPublicationNavigator {
    
    // MARK: - Variables
    let viewController: GiftPublicationViewController
    
    init(viewController: GiftPublicationViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Navigations
    func backToAddToLanding() {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func moveToAddToCart() {
        if let cart = viewController.navigationController?.viewControllers.first(where: {$0.isKind(of: TabbarViewController.self)}) as? TabbarViewController{
            cart.selectedIndex = 4
            viewController.navigationController?.popViewController(animated: false)
        }
    }
}



