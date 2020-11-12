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
    
    // MARK: - Variables
    var arrayFeature: [InfoFeature] = []
    var arrayConnection: [InfoConnection] = []
    var arrayLibrary: [InfoLibrary] = []
    var arrayvideo: [InfoLibrary] = []
    var arrayAudio: [InfoLibrary] = []
    lazy var landingViewNavigator: LandingViewNavigation = LandingViewNavigation(self)
   
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
        arrayFeature.append(InfoFeature(image: UIImage(named: "bg") ?? UIImage()))
        arrayFeature.append(InfoFeature(image: UIImage(named: "bg-4") ?? UIImage()))
        arrayFeature.append(InfoFeature(image: UIImage(named: "bg-5") ?? UIImage()))
        arrayFeature.append(InfoFeature(image: UIImage(named: "bg-6") ?? UIImage()))
        arrayFeature.append(InfoFeature(image: UIImage(named: "bg-7") ?? UIImage()))
        arrayConnection.append(InfoConnection(image: UIImage(named: "connection") ?? UIImage()))
        arrayConnection.append(InfoConnection(image: UIImage(named: "bg-9") ?? UIImage()))
        arrayConnection.append(InfoConnection(image: UIImage(named: "bg-10") ?? UIImage()))
        arrayConnection.append(InfoConnection(image: UIImage(named: "bg-11") ?? UIImage()))
        arrayConnection.append(InfoConnection(image: UIImage(named: "bg-12") ?? UIImage()))
        arrayLibrary.append(InfoLibrary(image: UIImage(named: "bg-13") ?? UIImage(), videoImage:  UIImage()))
        arrayLibrary.append(InfoLibrary(image: UIImage(named: "bg-14") ?? UIImage(), videoImage:  UIImage()))
        arrayLibrary.append(InfoLibrary(image: UIImage(named: "bg-15") ?? UIImage(), videoImage:  UIImage()))
        arrayLibrary.append(InfoLibrary(image: UIImage(named: "bg-16") ?? UIImage(), videoImage:  UIImage()))
        arrayvideo.append(InfoLibrary(image: UIImage(named: "bg-17") ?? UIImage(), videoImage:  UIImage(named: "videoPlay") ?? UIImage()))
        arrayvideo.append(InfoLibrary(image: UIImage(named: "bg-18") ?? UIImage(), videoImage:  UIImage(named: "videoPlay") ?? UIImage()))
        arrayvideo.append(InfoLibrary(image: UIImage(named: "bg-19") ?? UIImage(), videoImage:  UIImage(named: "videoPlay") ?? UIImage()))
        arrayvideo.append(InfoLibrary(image: UIImage(named: "bg-10") ?? UIImage(), videoImage:  UIImage(named: "videoPlay") ?? UIImage()))
        arrayAudio.append(InfoLibrary(image: UIImage(named: "bg") ?? UIImage(), videoImage:  UIImage()))
        arrayAudio.append(InfoLibrary(image: UIImage(named: "bg-4") ?? UIImage(), videoImage:  UIImage()))
        arrayAudio.append(InfoLibrary(image: UIImage(named: "bg-2") ?? UIImage(), videoImage:  UIImage()))
        arrayAudio.append(InfoLibrary(image: UIImage(named: "bg-3") ?? UIImage(), videoImage:  UIImage()))
        var landings:[LandingSections] = [LandingSections]()
        landings.append(LandingSections(title: "Libraries",arrayLibrary: arrayLibrary))
        landings.append(LandingSections(title: "Videos",arrayLibrary: arrayvideo))
        landings.append(LandingSections(title: "Audios",arrayLibrary: arrayAudio))
        
        for item in landings {
            let landingView = ViewHorizontalSection.shared
            landingView.landing = item
            landingView.didSelectedDetailsTestimonios = {
                self.landingViewNavigator.moveToDetailTest {
                    self.landingViewNavigator.moveToAddToCart()
                }
            }
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
        if pagerView == viewConnectionsPager {
            return arrayConnection.count
        } else {
            return arrayFeature.count
        }
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        if pagerView == viewConnectionsPager {
            if let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "connectionsCell", at: index) as? ConnectionsCell {
                cell.detailConnection = arrayConnection[index]
                return cell
            }
        } else {
            if let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "featuredCell", at: index) as? FeaturedVideoCell {
                cell.detailFeature = arrayFeature[index]
                return cell
            }
        }
        return FSPagerViewCell()
    }
}
