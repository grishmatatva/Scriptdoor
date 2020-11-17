//
//  GiftPublicationNavigator.swift
//  ScriptDoor
//
//  Created by PCQ187 on 17/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

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
        if let cart = UIStoryboard.cart.getViewController(type: AddToCartViewController.self) {
            viewController.navigationController?.pushViewController(cart, animated: true)
        }
    }
}
