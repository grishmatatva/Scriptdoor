//
//  FeaturedVideoCell.swift
//  ScriptDoor
//
//  Created by pcq196 on 21/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import FSPagerView

struct InfoFeature {
    var image: UIImage
}

class FeaturedVideoCell: FSPagerViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var imageFeature: UIImageView!
    
    // MARK: - Variable
    var detailFeature: InfoFeature? {
        didSet {
            imageFeature.image = detailFeature?.image ?? UIImage()
        }
    }
}
