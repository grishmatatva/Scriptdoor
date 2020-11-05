//
//  ConnectionsCell.swift
//  ScriptDoor
//
//  Created by pcq196 on 21/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView

struct InfoConnection {
    var image: UIImage
}

class ConnectionsCell: FSPagerViewCell {
    
    // MARK: - Outlets
       @IBOutlet private weak var imageFeature: UIImageView!
       
       // MARK: - Variable
       var detailConnection: InfoConnection? {
           didSet {
               imageFeature.image = detailConnection?.image ?? UIImage()
           }
       }
    
}
