//
//  CartView.swift
//  ScriptDoor
//
//  Created by PCQ187 on 12/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

struct CartName {
    var cartItem: String?
}
class CartView: UIView {

    // MARK: - Outlet
    @IBOutlet private weak var labelCartItem: UILabel!
    
    // MARK: - Varibles
    var detailCart: CartName? {
        didSet {
            labelCartItem.text = (detailCart?.cartItem)?.uppercased()
        }
    }

   static var shared: CartView {
        return (UINib(nibName: "CartView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? CartView)!
    }
}
