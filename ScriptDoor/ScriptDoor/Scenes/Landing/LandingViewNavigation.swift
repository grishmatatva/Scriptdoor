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
   func moveToDetailTest() {
        if let detailVc = UIStoryboard.detailsTest.getViewController(type: DetailsTestimoniolsViewController.self ) {
            viewController.present(detailVc, animated: true, completion: nil)
        }
    }
}
