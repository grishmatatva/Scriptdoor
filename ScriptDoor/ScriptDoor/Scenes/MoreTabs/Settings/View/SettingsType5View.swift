//
//  SettingsType1View.swift
//  ScriptDoor
//
//  Created by pcq196 on 11/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class SettingsType5View: UIView {
    
    static var shared: SettingsType5View {
        return UINib(nibName: "SettingsType5View", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SettingsType5View
    }
    
}
