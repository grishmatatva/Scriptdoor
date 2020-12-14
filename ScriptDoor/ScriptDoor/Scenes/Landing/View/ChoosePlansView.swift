//
//  ChoosePlansView.swift
//  ScriptDoor
//
//  Created by pcq196 on 22/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
struct PlanDetails {
    var type : String
    var price: String = ""
    var token: String = ""
    var matirial: String = ""
    var space: String = ""
    var templets: String = ""
}

class ChoosePlansView: UIView {

    // MARK: - Outlet
    @IBOutlet private weak var labelPlanName: UILabel!
    
     // MARK: - Variables
    var plan: PlanDetails? {
        didSet {
            labelPlanName.text = (plan?.type ?? "").uppercased()
        }
    }
    
    static var shared: ChoosePlansView {
        return (UINib(nibName: "ChoosePlansView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? ChoosePlansView)!
    }

}
