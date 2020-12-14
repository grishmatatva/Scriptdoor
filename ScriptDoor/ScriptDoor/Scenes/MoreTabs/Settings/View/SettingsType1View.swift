//
//  SettingsType1View.swift
//  ScriptDoor
//
//  Created by pcq196 on 11/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class SettingsType1View: UIView {
    
    @IBOutlet weak private var labelSettingName: UILabel!
    @IBOutlet weak private var labelSettingDescription: UILabel!
    @IBOutlet weak private var buttonSwitch: UIButton!
    static var shared: SettingsType1View {
        return UINib(nibName: "SettingsType1View", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SettingsType1View
    }
    var settings: SDSettings? {
        didSet {
            labelSettingName.text = settings?.title ?? ""
            labelSettingDescription.text = settings?.description ?? ""
            buttonSwitch.isSelected = false
        }
    }
    @IBAction private func didTapOnSwitch() {
        buttonSwitch.isSelected = !buttonSwitch.isSelected 
    }
}
