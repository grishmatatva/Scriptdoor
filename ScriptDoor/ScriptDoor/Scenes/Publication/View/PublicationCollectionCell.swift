//
//  PublicationCollectionCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 21/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

struct InfoPublicationColl {
    var image: UIImage
}

class PublicationCollectionCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var imageFeature: UIImageView!
    
    // MARK: - Variable
    var detailPublication: InfoPublicationColl? {
        didSet {
            imageFeature.image = detailPublication?.image ?? UIImage()
        }
    }
}
