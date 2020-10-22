//
//  LandingViewController.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 19/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView

class LandingViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var textSearch: UITextField!
    @IBOutlet private weak var viewConfirmProfile: UIView!
    @IBOutlet private weak var viewGotNewIdea: UIView!
    @IBOutlet private weak var viewFeatureVideos: FSPagerView!
    @IBOutlet private weak var viewConnectionsPager: FSPagerView!
    @IBOutlet private weak var stackViewLandings: UIStackView!
    @IBOutlet private weak var stackViewPlans: UIStackView!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Helper Method
    private func prepareView() {
        viewFeatureVideos.dataSource = self
        viewFeatureVideos.register(UINib(nibName: "FeaturedVideoCell", bundle: nil), forCellWithReuseIdentifier: "featuredCell")
        viewConnectionsPager.register(UINib(nibName: "ConnectionsCell", bundle: nil), forCellWithReuseIdentifier: "connectionsCell")
        viewFeatureVideos.itemSize = CGSize(width: view.frame.size.width - 80, height: 172)
        viewConnectionsPager.itemSize = CGSize(width: 201, height: 229)
        viewFeatureVideos.reloadData()
        var landings:[LandingSections] = [LandingSections]()
        landings.append(LandingSections(title: "Libraries"))
        landings.append(LandingSections(title: "Videos"))
        landings.append(LandingSections(title: "Audios"))
        
        for item in landings {
            let landingView = ViewHorizontalSection.shared
            landingView.landing = item
            stackViewLandings.addArrangedSubview(landingView)
        }
        let plan1 = ChoosePlansView.shared
        plan1.plan = PlanDetails(type: "Individuals")
        stackViewPlans.addArrangedSubview(plan1)
        let plan2 = ChoosePlansView.shared
        plan2.plan = PlanDetails(type: "Business")
        stackViewPlans.addArrangedSubview(plan2)
    }
    
    // MARK: - Action Methods
    @IBAction func didTapOnDoItLater() { viewConfirmProfile.isHidden = true }
}

// MARK: - PagerViewExtension
extension LandingViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 10
    }
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        if pagerView == viewConnectionsPager {
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "connectionsCell", at: index)
            return cell
        } else {
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "featuredCell", at: index)
            return cell
        }
    }
}
