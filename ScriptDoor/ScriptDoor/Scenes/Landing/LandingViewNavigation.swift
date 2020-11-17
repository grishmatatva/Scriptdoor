//
//  LandingViewNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 06/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class LandingViewNavigation {
    
    // MARK: - Variable
    var viewController: LandingViewController
    init(_ controller: LandingViewController) { viewController = controller }
    
    // MARK: - Navigations
    func moveToDetailTest(didAddedToCard: @escaping(() -> Void),didSelectedGift: @escaping(() -> Void)) {
        if let detailVc = UIStoryboard.detailsTest.getViewController(type: DetailsTestimoniolsViewController.self ) {
            detailVc.didAddToCard = didAddedToCard
            detailVc.didAddToGift = didSelectedGift
            viewController.present(detailVc, animated: true, completion: nil)
        }
    }
    
    func moveToAddToCart() {
        (viewController.parent as? UITabBarController)?.selectedIndex = 4
    }
    
    func moveToGift() {
        if let gift = UIStoryboard.detailsTest.getViewController(type: GiftPublicationViewController.self) {
            viewController.navigationController?.pushViewController(gift, animated: true)
        }
    }
}
