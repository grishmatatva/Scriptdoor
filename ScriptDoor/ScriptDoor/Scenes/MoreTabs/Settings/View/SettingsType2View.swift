//
//  SettingsType2View.swift
//  ScriptDoor
//
//  Created by pcq196 on 11/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class SettingsType2View: UIView {
   
    @IBOutlet weak private var labelSettingName: UILabel!
    @IBOutlet weak private var labelSettingDescription: UILabel!
    @IBOutlet weak private var buttonType: UIButton!
    static var shared: SettingsType2View {
        return UINib(nibName: "SettingsType2View", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SettingsType2View
    }
    var settings: SDSettings? {
        didSet {
            labelSettingName.text = settings?.title ?? ""
            labelSettingDescription.text = settings?.description ?? ""
            buttonType.setTitle(settings?.type2Name ?? "", for: .normal)
        }
    }
    @IBAction private func didTapOnType() {
        
    }
    
}
