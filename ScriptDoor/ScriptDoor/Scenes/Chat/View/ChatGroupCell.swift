//
//  ChatGroupCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 02/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

struct InfoChatGroup {
    var image: UIImage?
    var name: String
    var day: String
}

class ChatGroupCell: UITableViewCell {

   // MARK: - Outlet
      @IBOutlet private weak var chatImageView: UIImageView!
      @IBOutlet private weak var labelName: UILabel!
      @IBOutlet private weak var labelDay: UILabel!
      
      // MARK: - Variable
      var detailChat: InfoChatGroup? {
          didSet {
              chatImageView.image = detailChat?.image ?? UIImage()
              labelName.text = detailChat?.name ?? ""
              labelDay.text = detailChat?.day ?? ""
          }
      }
}
