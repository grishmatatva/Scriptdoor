//
//  WelcomeViewController.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 07/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
   
    // MARK: - Variables
    private lazy var viewNavigator: WelcomeViewNavigator = WelcomeViewNavigator(self)
    
    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Methods
    @IBAction private func didTapOnSignUp() { viewNavigator.moveToSignUp() }
}
