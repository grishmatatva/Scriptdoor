//
//  MoreViewNavigator.swift
//  ScriptDoor
//
//  Created by PCQ187 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

enum MoreTabsNavigator: Int{
    case wipod = 0
    case privateLibrary  = 1
    case publicLibrary = 2
    case analytics = 3
    case supplementryAccount = 4
    case subscriptionPlans = 5
    case wallet = 6
    case settings = 7
}

final class MoreViewNavigator {
    var viewController: MoreViewController
    init(_ controller: MoreViewController) { viewController = controller }
    
    func moveTo(tab: MoreTabsNavigator) {
        switch tab {
        case .wipod:
            if let wipodVc = UIStoryboard.more.getViewController(type: WipodViewController.self) {
                viewController.navigationController?.pushViewController(wipodVc, animated: true)
            }
        case .wallet:
            if let walletVc = UIStoryboard.wallet.getViewController(type: WalletViewController.self) {
                viewController.navigationController?.pushViewController(walletVc, animated: true)
            }
        case .subscriptionPlans:
            if let subscriptionPlanVc = UIStoryboard.wallet.getViewController(type: SubscriptionViewController.self) {
                viewController.navigationController?.pushViewController(subscriptionPlanVc, animated: true)
            }
        case .settings:
            if let settingsVc = UIStoryboard.settings.getViewController(type: SettingsViewController
                .self) {
                viewController.navigationController?.pushViewController(settingsVc, animated: true)
            }
        default:
            break
        }
    }
}
