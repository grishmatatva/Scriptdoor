//
//  AddToCartViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 11/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

struct CartModel {
    var itemName: String
    var qty: Int
    var date: String
    var tokens: Int
    
    mutating func minusCart() {
        if qty > 0 { qty -= 1 }
    }
    mutating func plushCart() {
        if qty > 0 { qty += 1 }
    }
}
class AddToCartViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var cartView: UIStackView!
    @IBOutlet private weak var labelTotal: UILabel!
    @IBOutlet private weak var labelCartNumber: UILabel!
    
    // MARK: - Variables
    var arrayCart: [CartModel] = [CartModel]()
    
    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCartData()
        prepareView()
    }
    private func prepareCartData() {
        arrayCart.append(CartModel(itemName: "Photo", qty: 1, date: "", tokens: 200))
        arrayCart.append(CartModel(itemName: "Video", qty: 1, date: "", tokens: 200))
        arrayCart.append(CartModel(itemName: "Advertisement", qty: 1, date: "", tokens: 200))
    }
    private func prepareView() {
        cartView.removeAllSubviews()
        if arrayCart.count > 0 {
            for i in 0...arrayCart.count - 1{
                let viewCart = CartView.shared
                viewCart.detailCart = arrayCart[i]
                viewCart.didDeletedItem = {
                    self.arrayCart.remove(at: i)
                    self.prepareView()
                }
                viewCart.didQtyPlush = {
                    self.arrayCart[i].plushCart()
                    self.refreshTotalAmount()
                }
                viewCart.didQtyMinus = {
                    self.arrayCart[i].minusCart()
                    self.refreshTotalAmount()
                }
                cartView.addArrangedSubview(viewCart)
            }
             labelCartNumber.text = "\(arrayCart.count)"

        } else {
            arrayCart.removeAll()
        }
        refreshTotalAmount()
    }
    
    func refreshTotalAmount() {
        var totalAmount:Int = 0
        totalAmount = self.arrayCart.map({$0.qty * $0.tokens}).reduce(0,+)
        labelTotal.text = "\(totalAmount) Tokens"
    }
    
    @IBAction private func didTapOnClear() {
        labelCartNumber.text = "0"
        labelTotal.text = "0 Tokens"
        cartView.removeAllSubviews()
    }
}
