//
//  OnBoardingViewNavigator.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

final class OnBoardingViewNavigator {
    
    // MARK: - Variables
    private let viewController: OnBoardingViewController
    init(_ controller: OnBoardingViewController) { viewController = controller  }
    
    // MARK: - Navigations
    func moveToSignUp() {
        if let signUpVc = UIStoryboard.authontication.getViewController(type: WelcomeViewController.self ) {
            viewController.navigationController?.pushViewController(signUpVc, animated: true)
        }
    }
}
