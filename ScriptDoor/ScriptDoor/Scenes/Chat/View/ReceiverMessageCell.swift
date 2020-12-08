//
//  SenderMessageCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 08/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit



class ReceiverMessageCell: UITableViewCell {

    @IBOutlet private weak var labelMessageText: UILabel!
    
    var message: ScriptDoorMessage?{
        didSet{
            labelMessageText.text = message?.message ?? ""
        }
    }
    
}
