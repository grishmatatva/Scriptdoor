//
//  SettingsType1View.swift
//  ScriptDoor
//
//  Created by pcq196 on 11/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class PhoneNumber: UIView {
    
    @IBOutlet weak private var labelSettingName: UILabel!
    @IBOutlet weak private var labelSettingDescription: UILabel!
    static var shared: PhoneNumber {
        return UINib(nibName: "PhoneNumber", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! PhoneNumber
    }
    var settings: SDSettings? {
        didSet {
            labelSettingName.text = settings?.title ?? ""
            labelSettingDescription.text = settings?.description ?? ""
        }
    }
  
}
