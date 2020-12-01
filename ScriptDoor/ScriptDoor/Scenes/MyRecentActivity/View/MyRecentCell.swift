//
//  MyRecentCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 25/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import EzPopup

struct InfoRecent {
    var recImage: UIImage?
    var recName: String?
    var workName: String?
    var isSelected: Bool = false
}

class MyRecentCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var recentImageView: UIImageView!
    @IBOutlet private weak var labelRecent: UILabel!
    @IBOutlet private weak var labelWork: UILabel!
    @IBOutlet private weak var btnMore: UIButton!
    
    // MARK: - Variable
    var didMessageChange:((Bool, UIButton) -> Void)?
    var detailRecent: InfoRecent? {
        didSet {
            recentImageView.image = detailRecent?.recImage ?? UIImage()
            labelWork.text = detailRecent?.workName ?? ""
            labelRecent.text = detailRecent?.recName ?? ""
            btnMore.isSelected = detailRecent?.isSelected ?? false
        }
    }
    
    // MARK: - Action Methods
    @IBAction private func didTapOnMessage(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        didMessageChange? (sender.isSelected,sender)
    }
}


