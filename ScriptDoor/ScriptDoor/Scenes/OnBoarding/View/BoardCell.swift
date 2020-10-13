//
//  BoardCell.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 07/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

// MARK: - Struct
struct BoardData {
    var image: UIImage?
    var title: String?
    var subTitle: String?
}

// MARK: - Class
class BoardCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var boardImage: UIImageView!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelSubTitle: UILabel!
    
    // MARK: Variable
    var boardDetail: BoardData? {
        didSet {
            boardImage.image = boardDetail?.image ?? UIImage()
            labelTitle.text = boardDetail?.title ?? ""
            labelSubTitle.text = boardDetail?.subTitle ?? ""
        }
    }
}
