//
//  ChatCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 30/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

struct InfoChat {
    var image: UIImage?
    var name: String
    var mess: String
}

class ChatCell: UITableViewCell {

    // MARK: - Outlet
    @IBOutlet private weak var chatImageView: UIImageView!
    @IBOutlet private weak var labelName: UILabel!
    @IBOutlet private weak var labelMessage: UILabel!
    
    // MARK: - Variable
    var detailChat: InfoChat? {
        didSet {
            chatImageView.image = detailChat?.image ?? UIImage()
            labelName.text = detailChat?.name ?? ""
            labelMessage.text = detailChat?.mess ?? ""
        }
    }
}
