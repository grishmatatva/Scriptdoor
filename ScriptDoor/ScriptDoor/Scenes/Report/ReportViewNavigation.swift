//
//  ReportViewNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 17/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import Foundation

class ReportViewNavigation {
    
    // MARK: - Variable
    var viewController: ReportViewController
    init(_ controller: ReportViewController) { viewController = controller }
    
    // MARK: - Navigations
    func backToDetail() {
            viewController.dismiss(animated: true, completion: nil)
    }
}
