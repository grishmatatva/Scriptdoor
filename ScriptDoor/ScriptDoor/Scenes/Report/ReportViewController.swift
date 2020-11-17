//
//  ReportViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 17/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {

    // MARK: - Variable
    lazy var viewNavigation: ReportViewNavigation =  ReportViewNavigation(self)
    

    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Methods
    @IBAction private func didTapOnCross() {
        viewNavigation.backToDetail()
    }
    
    @IBAction private func didTapCheckBox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}
