//
//  LibraryCell.swift
//  ScriptDoor
//
//  Created by pcq196 on 22/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import FSPagerView

struct InfoLibrary {
    var image: UIImage
}
class LibraryCell: FSPagerViewCell {

    // MARK: - Outlet
    @IBOutlet private weak var imageLibrary: UIImageView!
     
    // MARK: - Variable
    var detailLibrary: InfoLibrary? {
        didSet {
            imageLibrary.image = detailLibrary?.image
        }
    }
}
