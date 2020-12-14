//
//  SettingsType1View.swift
//  ScriptDoor
//
//  Created by pcq196 on 11/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class SDStorageView: UIView {
    
    @IBOutlet weak private var labelSettingName: UILabel!
    @IBOutlet weak private var labelSettingDescription: UILabel!
    
    static var shared: SDStorageView {
        return UINib(nibName: "SDStorageView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SDStorageView
    }
    var settings: SDSettings? {
        didSet {
            labelSettingName.text = settings?.title ?? ""
            labelSettingDescription.text = settings?.description ?? ""
    
        }
    }
    
}
