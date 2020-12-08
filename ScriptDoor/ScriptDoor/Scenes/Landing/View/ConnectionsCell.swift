//
//  ConnectionsCell.swift
//  ScriptDoor
//
//  Created by pcq196 on 21/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView

struct InfoConnection {
    var image: UIImage
}
enum ConnectionCellType {
    case landing
    case search
    
    var backColor: UIColor {
        switch self {
        case .landing: return .white
        case .search: return UIColor.appColors.white243_243_243
        }
    }
}
class ConnectionsCell: UICollectionViewCell {
    
    // MARK: - Outlets
       @IBOutlet private weak var imageFeature: UIImageView!
       @IBOutlet private weak var viewBackground: UIView!
       // MARK: - Variable
       var detailConnection: InfoConnection? {
           didSet {
               imageFeature.image = detailConnection?.image ?? UIImage()
           }
       }
    var cellType: ConnectionCellType?{
        didSet {
            viewBackground.backgroundColor = cellType?.backColor
        }
    }
}
