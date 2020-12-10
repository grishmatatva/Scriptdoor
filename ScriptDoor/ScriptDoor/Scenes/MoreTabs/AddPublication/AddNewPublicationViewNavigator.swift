//
//  AddNewPublicationViewNavigator.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

final class AddNewPublicationViewNavigator {
    var viewController: AddNewPublicationViewController
    init(_ controller: AddNewPublicationViewController) { viewController = controller }
    
    func moveToMore() { viewController.navigationController?.popViewController(animated: true) }
    func moveToTemplete() {
        if let newPublicationVc = UIStoryboard.more.getViewController(type: CreatePublicationViewController.self) {
            viewController.navigationController?.pushViewController(newPublicationVc, animated: true)
        }
    }
    func moveToUploadPublication() {
        if let uploadPublicationVc = UIStoryboard.more.getViewController(type: UploadPublicationViewController.self) {
            viewController.navigationController?.pushViewController(uploadPublicationVc, animated: true)
        }
    }
}


