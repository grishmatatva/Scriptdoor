//
//  ChatStartGroupCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 03/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class ChatStartGroupCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var groupProfileImage: UIImageView!
    @IBOutlet private weak var groupProName: UILabel!
    @IBOutlet private weak var btnCancel: UIButton!
    
    // MARK: - Variable
    var didTakeCancel: ((Int) -> Void)?
    var detailStartGroup: InfoGroupChat? {
        didSet {
            groupProfileImage.image = detailStartGroup?.image ?? UIImage()
            groupProName.text = detailStartGroup?.name ?? ""
            btnCancel.isSelected = detailStartGroup?.isSelected ?? false
        }
    }
    
    @IBAction func didTapOnCancel(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        didTakeCancel?(detailStartGroup?.id ?? 0)
    }
}
