//
//  AddNewMaterialViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class AddNewMaterialViewController: UIViewController {
    // MARK: - Outlet
    
    // MARK: - Variables
    lazy var viewNavigator: AddNewMaterialViewNavigator = AddNewMaterialViewNavigator(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction private func didTapOnBack() { navigationController?.popViewController(animated: true) }
    @IBAction private func didTapOnPublication() {
        viewNavigator.moveToNewPublication()
    }

}
