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
        let labelBlue = UIColor(named: "LabelBlue")!
        let appWhiteProfile = UIColor(named: "AppWhiteProfile")!
        let white243_243_243 = UIColor(named: "243_243_243")!
        let lightGray = UIColor(named: "LightGray")!
        let appBlack = UIColor(named: "AppBlack")!
        let yellow243_212_142 = UIColor(named: "243_212_142")!
        
    }
    static var appColors : AppColors {
        return AppColors()
    }
}
