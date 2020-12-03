//
//  ChatStartGroupCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 03/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

struct InfoStartGroup {
    var image: UIImage?
    var name: String
}

class ChatStartGroupCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var groupProfileImage: UIImageView!
    @IBOutlet private weak var groupProName: UILabel!
    
    // MARK: - Variable
    var detailStartGroup: InfoStartGroup? {
        didSet {
            groupProfileImage.image = detailStartGroup?.image ?? UIImage()
            groupProName.text = detailStartGroup?.name ?? ""
        }
    }
}
