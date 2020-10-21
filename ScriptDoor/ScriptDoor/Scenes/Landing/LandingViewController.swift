//
//  LandingViewController.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 19/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var textSearch: UITextField!
    @IBOutlet private weak var profileConfirm : NSLayoutConstraint!
    @IBOutlet private weak var btnDoItLater: UIButton!
    @IBOutlet private weak var btnClickToConfirm: UIButton!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Action Methods
    @IBAction func didTapOnDoItLater() {
        self.profileConfirm.constant = 0
        btnDoItLater.isHidden = true
        btnClickToConfirm.isHidden = true
    }
}
