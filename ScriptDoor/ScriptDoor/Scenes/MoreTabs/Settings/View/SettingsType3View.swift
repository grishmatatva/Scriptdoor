//
//  SettingsType1View.swift
//  ScriptDoor
//
//  Created by pcq196 on 11/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class SettingsType3View: UIView {
    
    @IBOutlet weak private var labelSettingName: UILabel!
    @IBOutlet weak private var labelSettingDescription: UILabel!
    @IBOutlet weak private var viewDetails: UIView!
    
    static var shared: SettingsType3View {
        return UINib(nibName: "SettingsType3View", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SettingsType3View
    }
    var settings: SDSettings? {
        didSet {
            labelSettingName.text = settings?.title ?? ""
            labelSettingDescription.text = settings?.description ?? ""
            viewDetails.isHidden = !(settings == SDSettings.manageAdvertisements  )
        }
    }
   
}
