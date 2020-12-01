//
//  MoreCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 28/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

struct InfoMore {
    var moreButtonTitle: String
    var moreButtonImage: String
}

class MoreCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var btnMore: UIButton!

    
    // MARK: - Variable
    var detailMore: InfoMore? {
        didSet {
            btnMore.setImage(UIImage(named: detailMore?.moreButtonImage ?? ""), for: .normal)
            btnMore.setTitle(detailMore?.moreButtonTitle ?? "", for: .normal)
        }
    }
}
