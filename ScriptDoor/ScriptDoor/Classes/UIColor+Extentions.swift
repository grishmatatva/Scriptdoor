//
//  UIColor+Extentions.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

extension UIColor {
    struct AppColors {
        let inActiveTextField = UIColor(named: "disableTextField")
    }
    static var appColors : AppColors {
        return AppColors()
    }
}
