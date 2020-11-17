//
//  DetailsTestimoniolsViewNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 10/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class DetailsTestimoniolsViewNavigation {
    
    // MARK: - Variable
    var viewController: DetailsTestimoniolsViewController
    init(_ controller: DetailsTestimoniolsViewController) { viewController = controller }
    
    // MARK: - Navigations
    func backToLanding() {
            viewController.dismiss(animated: true, completion: nil)
    }
    
    func moveToCart(complition: @escaping(() -> Void)) {
        viewController.dismiss(animated: true) {
            complition()
        }
    }
    
    func moveToGift(complition: @escaping(() -> Void)) {
        viewController.dismiss(animated: true) {
            complition()
        }
    }
    
    func moveToReport() {
        if let report = UIStoryboard.detailsTest.getViewController(type: ReportViewController.self ) {
            viewController.present(report, animated: true, completion: nil)
        }
    }
}
