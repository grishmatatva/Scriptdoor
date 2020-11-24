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
    @IBOutlet private weak var labelTokens: UILabel!
    @IBOutlet private weak var labelQty: UILabel!
    // MARK: - Varibles
    var didDeletedItem:(() -> ())?
    var didQtyPlush:(() -> ())?
    var didQtyMinus:(() -> ())?
    var detailCart: CartModel? {
        didSet {
            labelCartItem.text = (detailCart?.itemName)?.uppercased()
            labelQty.text = "\(detailCart?.qty ?? 0)"
            labelTokens.text = "\(detailCart?.tokens ?? 0) tokens"
            
        }
    }

    static var shared: CartView {
        return (UINib(nibName: "CartView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? CartView)!
    }
    
    // MARK: - Action Methods
    @IBAction private func didTapOnDelete() { didDeletedItem?() }
    @IBAction private func didTapOnMinues() {
        if detailCart?.qty ?? 0 > 0 {
            detailCart!.qty -= 1
        }
         labelQty.text = "\(detailCart?.qty ?? 0)"
        didQtyMinus?()
    }
    @IBAction private func didTapOnPlush() {
        if detailCart?.qty ?? 0 > 0 {
            detailCart!.qty += 1
        }
        labelQty.text = "\(detailCart?.qty ?? 0)"
        didQtyPlush?()
    }
}
