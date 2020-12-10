//
//  UploadPublicationNavigator.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class UploadPublicationNavigator {
    private var viewController: UploadPublicationViewController
    init(_ controller: UploadPublicationViewController) { viewController = controller }
    
    func moveToPublicationOption() { viewController.navigationController?.popViewController(animated: true) }
}
