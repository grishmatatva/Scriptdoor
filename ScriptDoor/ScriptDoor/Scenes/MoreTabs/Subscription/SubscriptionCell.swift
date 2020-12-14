//
//  SubscriptionCell.swift
//  ScriptDoor
//
//  Created by PCQ187 on 10/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView

class SubscriptionCell: FSPagerViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var labelPlanName: UILabel!
    @IBOutlet private weak var labelTokens: UILabel!
    @IBOutlet private weak var labelPrice: UILabel!
    @IBOutlet private weak var labelMaterial: UILabel!
    @IBOutlet private weak var labelSpace: UILabel!
    @IBOutlet private weak var labelTempletes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var plan: PlanDetails? {
        didSet {
            labelPlanName.text = (plan?.type ?? "").capitalized
            labelTokens.text = plan?.token ?? ""
            if let price = plan?.price,price.trimmedLength > 0{
                labelPrice.text = "($ " + price + ")"
            }
            labelMaterial.text = plan?.matirial ?? ""
            labelSpace.text = plan?.space ?? ""
            labelTempletes.text = plan?.templets ?? ""
        }
    }
    var currentDisplayPlan: Bool!{
        didSet {
            backView.backgroundColor = currentDisplayPlan ? UIColor.white : UIColor.appColors.yellow243_212_142
        }
    }
}
