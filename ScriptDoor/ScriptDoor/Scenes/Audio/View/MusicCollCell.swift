//
//  MusicCollCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 21/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

struct InfoMusicColl {
    var image: UIImage
}

class MusicCollCell: UICollectionViewCell {

   @IBOutlet private weak var imageFeature: UIImageView!
   
   // MARK: - Variable
   var detailMusic: InfoMusicColl? {
       didSet {
           imageFeature.image = detailMusic?.image ?? UIImage()
       }
   }

}
