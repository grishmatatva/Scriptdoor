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
        cartView.addArrangedSubview(view1)
        let view2 = CartView.shared
        cartView.addArrangedSubview(view2)
        let view3 = CartView.shared
        cartView.addArrangedSubview(view3)
    }
}
