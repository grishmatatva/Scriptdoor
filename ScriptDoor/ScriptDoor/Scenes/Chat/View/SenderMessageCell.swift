//
//  SenderMessageCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 08/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

enum MessageSource {
    case sender
    case receiver
}
struct ScriptDoorMessage {
    var message: String
    var messageSource: MessageSource
    var messageTime: String
}

class SenderMessageCell: UITableViewCell {

    @IBOutlet private weak var labelMessageText: UILabel!
    
    var message: ScriptDoorMessage?{
        didSet{
            labelMessageText.text = message?.message ?? ""
        }
    }
    
}
