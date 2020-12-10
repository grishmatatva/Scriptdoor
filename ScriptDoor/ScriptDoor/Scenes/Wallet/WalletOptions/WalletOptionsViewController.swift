//
//  WalletOptionsViewController.swift
//  ScriptDoor
//
//  Created by pcq196 on 10/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class WalletOptionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        // Do any additional setup after loading the view.
    }
    // MARK: - Action Method
    @IBAction private func didTapOnClose() {
        dismiss(animated: true, completion: nil)
    }

}
