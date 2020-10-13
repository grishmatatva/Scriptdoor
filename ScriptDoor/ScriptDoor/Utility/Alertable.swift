//
//  Alertable.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class Utility {
    
    // MARK: - VARIABLE
    static let shared: Utility = Utility()
    
    // MARK: - HELPER METHOD
    func showAlert(title: String, message: String, controller: UIViewController ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
