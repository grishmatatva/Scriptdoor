//
//  AddToCartViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 11/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class AddToCartViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var cartView: UIStackView!
    
    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = CartView.shared
        //        view1?.detailCart = CartName(cartItem: "ABC")
        cartView.addArrangedSubview(view1 ?? cartView)
        //        let view2 = CartView.shared
        //        view2?.detailCart = CartName(cartItem: "EFG")
        //        cartView.addArrangedSubview(view2 ?? cartView)
        // Do any additional setup after loading the view.
    }
}
