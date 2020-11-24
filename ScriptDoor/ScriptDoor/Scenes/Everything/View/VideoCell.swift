//
//  VideoCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 20/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView

struct InfoVideo {
    var image: UIImage
}

class VideoCell: FSPagerViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var imageFeature: UIImageView!
    
    // MARK: - Variable
    var detailVideo: InfoVideo? {
        didSet {
            imageFeature.image = detailVideo?.image ?? UIImage()
        }
    }
}
