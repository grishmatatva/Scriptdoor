//
//  ChatGroupStartTbCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 03/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

struct InfoGroupChat {
    var id: Int
    var image: UIImage?
    var name: String
    var day: String
    var isSelected: Bool = false
}
class ChatGroupStartTbCell: UITableViewCell {
    
    // MARK: - Outlet
    @IBOutlet private weak var chatImageView: UIImageView!
    @IBOutlet private weak var labelName: UILabel!
    @IBOutlet private weak var labelDay: UILabel!
    @IBOutlet private weak var btnCheckBox: UIButton!
    
    // MARK: - Variable
    var didCheckBox: ((Bool)->(Void))?
    var detailChat: InfoGroupChat? {
        didSet {
            chatImageView.image = detailChat?.image ?? UIImage()
            labelName.text = detailChat?.name ?? ""
            labelDay.text = detailChat?.day ?? ""
            btnCheckBox.isSelected = detailChat?.isSelected ?? false
        }
    }
    
    // MARK: - Action Methods
    @IBAction private func didTapOnbtnCheck(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        didCheckBox? (sender.isSelected)
    }
}
