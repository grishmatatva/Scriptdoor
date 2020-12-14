//
//  WalletViewNavigator.swift
//  ScriptDoor
//
//  Created by PCQ187 on 10/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

final class WalletViewNavigator {
    var viewController: WalletViewController
    init(_ controller: WalletViewController) { viewController = controller }
    
    func moveToMore() { viewController.navigationController?.popViewController(animated: true) }
    func moveToWalletOptions() {
        if let walletOptVc = UIStoryboard.wallet.getViewController(type: WalletOptionsViewController.self) {
            walletOptVc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            walletOptVc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            viewController.present(walletOptVc, animated: true, completion: nil)
        }
           
    }
}
