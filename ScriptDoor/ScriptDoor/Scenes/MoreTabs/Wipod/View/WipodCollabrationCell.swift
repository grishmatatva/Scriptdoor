//
//  WipodCollabrationCell.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class WipodCollabrationCell: UICollectionViewCell {

    @IBOutlet private weak var imageFeature: UIImageView!
    
    // MARK: - Variable
    var detailPublication: InfoPublicationColl? {
        didSet {
            imageFeature.image = detailPublication?.image ?? UIImage()
        }
    }

}
