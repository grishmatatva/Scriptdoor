//
//  AudioCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 20/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView

struct InfoAudio {
    var image: UIImage
}

class AudioCell: FSPagerViewCell {

   // MARK: - Outlets
   @IBOutlet private weak var imageFeature: UIImageView!
   
   // MARK: - Variable
   var detailAudio: InfoAudio? {
       didSet {
           imageFeature.image = detailAudio?.image ?? UIImage()
       }
   }
}
