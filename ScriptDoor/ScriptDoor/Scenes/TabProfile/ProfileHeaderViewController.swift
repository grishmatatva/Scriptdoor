//
//  ProfileHeaderViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 24/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class ProfileHeaderViewController: UIViewController {
    
    // MARK: - Variable
    lazy var viewNavigation: ProfileHeaderViewNavigation = ProfileHeaderViewNavigation(viewController: self)
    
    // MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Custom Method
    @IBAction private func didTapOnAdd() {
        viewNavigation.moveToAdd()
    }
    
    @IBAction private func didTapOnEditProfile() {
        viewNavigation.moveToEditProfile()
        
    }
}
