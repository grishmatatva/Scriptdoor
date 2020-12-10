//
//  UploadPublicationCell.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class UploadPublicationCell: UITableViewCell {
    // MARK: - Outlet
    @IBOutlet private weak var optionButton1: UIButton!
    @IBOutlet private weak var viewExpanded: UIView!
    // MARK: - Variables
    var didExpandedCell:((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        optionButton1.titleLabel?.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - Action Methods
    @IBAction private func didTapOnExpand(){
        viewExpanded.isHidden = !viewExpanded.isHidden
        didExpandedCell?(viewExpanded.isHidden)
    }
}
