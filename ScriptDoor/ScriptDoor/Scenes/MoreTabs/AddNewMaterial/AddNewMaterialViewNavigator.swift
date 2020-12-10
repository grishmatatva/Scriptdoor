//
//  AddNewMaterialViewNavigator.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

final class AddNewMaterialViewNavigator {
    var viewController: AddNewMaterialViewController
    init(_ controller: AddNewMaterialViewController) { viewController = controller }
    
    func moveToMore() { viewController.navigationController?.popViewController(animated: true) }
    func moveToNewPublication() {
        if let newPublicationVc = UIStoryboard.more.getViewController(type: AddNewPublicationViewController.self) {
            viewController.navigationController?.pushViewController(newPublicationVc, animated: true)
        }
    }
}


