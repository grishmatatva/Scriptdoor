//
//  LibraryTableCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 21/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

struct InfoLibColl {
    var image: UIImage
}

class LibraryTableCell: UITableViewCell {

    // MARK: - Outlets
       @IBOutlet private weak var imageFeature: UIImageView!
       
       // MARK: - Variable
       var detailPublication: InfoLibColl? {
           didSet {
               imageFeature.image = detailPublication?.image ?? UIImage()
           }
       }
}
