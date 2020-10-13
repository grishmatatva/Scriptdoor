//
//  UIStoryboard+Extentions.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static var authontication: UIStoryboard {
        return UIStoryboard(name: "Authontication", bundle: nil)
    }
    
    func getViewController<T: UIViewController>(type: T.Type) -> T? {
        let id = String(describing: type)
        return instantiateViewController(withIdentifier: id) as? T
    }
}

