//
//  GiftPublicationViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 17/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class GiftPublicationViewController: UIViewController {

    // MARK: -  Variable
    lazy var viewNavigator: GiftPublicationNavigator = GiftPublicationNavigator(viewController: self)
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - LifeCycle Methods
    @IBAction private func didTapOnBack() {
        viewNavigator.backToAddToLanding()
    }
    
    @IBAction private func didTapGift() {
        viewNavigator.moveToAddToCart()
    }
}
