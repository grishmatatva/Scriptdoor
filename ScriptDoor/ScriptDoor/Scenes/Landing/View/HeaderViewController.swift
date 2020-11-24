//
//  HeaderViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 19/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController {

    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Action Methods
    @IBAction private func didTapOnBack() {
        self.navigationController?.popToViewController(viewController: LandingViewController.self)
    }
}
