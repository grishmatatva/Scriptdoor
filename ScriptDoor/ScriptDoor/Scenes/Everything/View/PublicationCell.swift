//
//  PublicationCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 19/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView

struct InfoPublication {
    var image: UIImage
}
class PublicationCell: FSPagerViewCell {

   // MARK: - Outlets
      @IBOutlet private weak var imageFeature: UIImageView!
      
      // MARK: - Variable
      var detailPublication: InfoPublication? {
          didSet {
              imageFeature.image = detailPublication?.image ?? UIImage()
          }
      }
}
