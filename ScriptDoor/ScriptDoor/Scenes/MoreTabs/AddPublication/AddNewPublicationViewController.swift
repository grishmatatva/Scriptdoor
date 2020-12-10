//
//  AddNewPublicationViewController.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class AddNewPublicationViewController: UIViewController {
    // MARK: - Outlets
    
    // MARK: - Variable
    private lazy var viewNavigator: AddNewPublicationViewNavigator = AddNewPublicationViewNavigator(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func didTapOnBack() { navigationController?.popViewController(animated: true) }
    @IBAction private func didTapOnSelectTemplete() { viewNavigator.moveToTemplete() }
    @IBAction private func didTapOnUploadNewPublication() { viewNavigator.moveToUploadPublication() }
}
