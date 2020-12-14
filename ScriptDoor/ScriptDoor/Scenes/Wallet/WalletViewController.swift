//
//  WalletViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 10/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import SJSegmentedScrollView
enum TransactionType: Int{
    case all = 1
    case debit = 2
    case credit = 3
}
class WalletViewController: UIViewController {

    @IBOutlet private weak var transactionView: UIView!
    @IBOutlet private weak var transactionAllButton: UIButton!
    @IBOutlet private weak var transactionDebitButton: UIButton!
    @IBOutlet private weak var transactionCreditButton: UIButton!
    // MARK: - Variables
    lazy var viewNavigator: WalletViewNavigator = WalletViewNavigator(self)
    
    let pageViewController: UIPageViewController  = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
    private var pagesController:[UIViewController]    = [UIViewController]()
    private var selectedTransactionTab: TransactionType = .all
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    private func prepareView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.view.layoutSubviews()
            self.prepareSearchSegment()
        }
        
    }
    private func prepareSearchSegment() {
        let headerController1 = UIStoryboard.wallet.getViewController(type: TransactionViewController.self)!
        let headerController2 = UIStoryboard.wallet.getViewController(type: TransactionViewController.self)!
        let headerController3 = UIStoryboard.wallet.getViewController(type: TransactionViewController.self)!
        let pageControllerView = pageViewController.view
        pagesController.append(headerController1)
        pageViewController.setViewControllers([headerController1] , direction: .forward, animated: false, completion: nil)
        pagesController.append(headerController2)
        pagesController.append(headerController3)
        transactionView.addSubview(pageControllerView!)
        addChild(pageViewController)
    }
    // MARK: - Action Methods
    @IBAction private func didSelectedTransactionType(sender: UIButton) {
        if let transactionTab = TransactionType(rawValue: sender.tag) {
            switch transactionTab {
            case .all:
                pageViewController.setViewControllers([pagesController.first!] , direction: .reverse, animated: true, completion: nil)
                
            case .debit:
                if selectedTransactionTab != .debit {
                    let animation = selectedTransactionTab == .all ? UIPageViewController.NavigationDirection.forward : UIPageViewController.NavigationDirection.reverse
                    pageViewController.setViewControllers([pagesController[1]] , direction: animation, animated: true, completion: nil)
                }
            case .credit:
                pageViewController.setViewControllers([pagesController.last!] , direction: .forward, animated: true, completion: nil)
            }
            selectedTransactionTab = transactionTab
            transactionCreditButton.isSelected = false
            transactionDebitButton.isSelected = false
            transactionAllButton.isSelected = false
            sender.isSelected = true
        }
    }
    @IBAction private func didTapOnWalletOptions(sender: UIButton) {
        sender.isSelected = sender.isSelected
        viewNavigator.moveToWalletOptions()
    }
    @IBAction private func didTapOnBack() { viewNavigator.moveToMore() }
}
