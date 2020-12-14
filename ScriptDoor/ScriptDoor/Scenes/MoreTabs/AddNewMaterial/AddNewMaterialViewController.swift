//
//  AddNewMaterialViewController.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/12/20.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
