//
//  SignUpAsAnViewController.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class SignUpAsAnViewController: UIViewController {
    
    // MARK: - Variables
    lazy var viewNavigation: SignUpAsAnViewNavigation = SignUpAsAnViewNavigation(viewController: self)
    var accountType: SignUpAs?
    // MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Methods
    @IBAction private func didTapOnSignUpAsIndividual() {
        accountType = .invidual
        viewNavigation.moveToInterest()
    }
    
    @IBAction private func didTapOnSignUpAsBusiness() {
        accountType = .business
        viewNavigation.moveToInterest()
    }
    
    @IBAction private func didTapOnExplore() {
        viewNavigation.moveToExplore()
    }

}
