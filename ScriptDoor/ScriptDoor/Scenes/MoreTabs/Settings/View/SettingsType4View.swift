//
//  SettingsType4View.swift
//  ScriptDoor
//
//  Created by pcq196 on 11/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class SettingsType4View: UIView {
    
    @IBOutlet weak private var labelSettingName: UILabel!
    @IBOutlet weak private var labelSettingDescription: UILabel!
    
    static var shared: SettingsType4View {
        return UINib(nibName: "SettingsType4View", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SettingsType4View
    }
    var settings: SDSettings? {
        didSet {
            labelSettingName.text = settings?.title ?? ""
            labelSettingDescription.text = settings?.description ?? ""
    
        }
    }
    
}
