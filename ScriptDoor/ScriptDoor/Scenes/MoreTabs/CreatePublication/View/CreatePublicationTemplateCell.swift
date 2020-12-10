//
//  CreatePublicationTemplateCell.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
struct PublicationTemplate {
    var templateName: String
    var image: UIImage
}
class CreatePublicationTemplateCell: UICollectionViewCell {

    @IBOutlet private weak var labelTemplate: UILabel!
    @IBOutlet private weak var templateImage: UIImageView!
    
    var template: PublicationTemplate? {
        didSet {
            labelTemplate.text = template?.templateName ?? ""
            templateImage.image = template?.image ?? UIImage()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
