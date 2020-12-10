//
//  CreatePublicationViewNavigator.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class CreatePublicationViewNavigator {
    private var viewController: CreatePublicationViewController
    init(_ controller: CreatePublicationViewController) { viewController = controller }
    
    func moveToPublicationOption() { viewController.navigationController?.popViewController(animated: true) }
}
