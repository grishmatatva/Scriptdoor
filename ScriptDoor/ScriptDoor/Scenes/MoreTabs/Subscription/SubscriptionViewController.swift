//
//  SubscriptionViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 10/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView

class SubscriptionViewController: UIViewController {
    
    @IBOutlet private weak var viewSubscription: FSPagerView!
    @IBOutlet private weak var yearlyPlan: UIButton!
    @IBOutlet private weak var monthlyPlan: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    private func prepareView() {
        yearlyPlan.isSelected = true
        viewSubscription.register(UINib(nibName: "SubscriptionCell", bundle: nil), forCellWithReuseIdentifier: "SubscriptionCell")
        viewSubscription.itemSize = CGSize(width: view.frame.size.width - 100, height: viewSubscription.frame.size.height - 100)
        viewSubscription.interitemSpacing = 20
    }
    @IBAction private func didTapOnBack() { navigationController?.popViewController(animated: true)}
    @IBAction private func didTapOnPlanYearly() {
        yearlyPlan.isSelected = true
        monthlyPlan.isSelected = false
    }
    @IBAction private func didTapOnPlanMonthly() {
        yearlyPlan.isSelected = false
        monthlyPlan.isSelected = true
    }
}
// MARK: - PagerViewExtension
extension SubscriptionViewController: FSPagerViewDataSource {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int { return 3 }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        if let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "SubscriptionCell", at: index) as? SubscriptionCell {
            cell.backgroundColor = .clear
            return cell
        }
        return FSPagerViewCell()
    }
}
