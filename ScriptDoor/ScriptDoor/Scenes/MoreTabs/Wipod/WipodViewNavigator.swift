//
//  WipodViewNavigator.swift
//  ScriptDoor
//
//  Created by PCQ187 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
final class WipodViewNavigator {
    var viewController: WipodViewController
    init(_ controller: WipodViewController) { viewController = controller }
    
    func moveToMore() { viewController.navigationController?.popViewController(animated: true) }
    func moveToNewPublication() {
        if let newPublicationVc = UIStoryboard.more.getViewController(type: AddNewMaterialViewController.self) {
            viewController.navigationController?.pushViewController(newPublicationVc, animated: true)
        }
    }
}


