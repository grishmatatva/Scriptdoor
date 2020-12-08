//
//  LandingViewController.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 19/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView
import SJSegmentedScrollView

class LandingViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var textSearch: UITextField!
    @IBOutlet private weak var viewConfirmProfile: UIView!
    @IBOutlet private weak var viewGotNewIdea: UIView!
    @IBOutlet private weak var viewFeatureVideos: FSPagerView!
    @IBOutlet private weak var viewConnectionsPager: UICollectionView!
    @IBOutlet private weak var stackViewLandings: UIStackView!
    @IBOutlet private weak var stackViewPlans: UIStackView!
    
    // MARK: - Variables
    var arrayFeature: [InfoFeature] = []
    var arrayConnection: [InfoConnection] = []
    var arrayLibrary: [InfoLibrary] = []
    var arrayvideo: [InfoVideo] = []
    var arrayAudio: [InfoAudio] = []
    let segmentController = SJSegmentedViewController()
    lazy var landingViewNavigator: LandingViewNavigation = LandingViewNavigation(self)
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        textSearch.isEnabled = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        textSearch.isEnabled = true
    }
    
    // MARK: - Helper Method
    private func prepareView() {
        viewFeatureVideos.dataSource = self
        viewFeatureVideos.register(UINib(nibName: "FeaturedVideoCell", bundle: nil), forCellWithReuseIdentifier: "featuredCell")
        viewConnectionsPager.register(UINib(nibName: "ConnectionsCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        viewFeatureVideos.itemSize = CGSize(width: view.frame.size.width - 80, height: 172)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 201, height: 229)
        layout.minimumLineSpacing = 10
        viewConnectionsPager.collectionViewLayout = layout
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
        arrayvideo.append(InfoVideo(image: UIImage(named: "bg-17") ?? UIImage()))
        arrayvideo.append(InfoVideo(image: UIImage(named: "bg-18") ?? UIImage()))
        arrayvideo.append(InfoVideo(image: UIImage(named: "bg-19") ?? UIImage()))
        arrayvideo.append(InfoVideo(image: UIImage(named: "bg-10") ?? UIImage()))
        arrayAudio.append(InfoAudio(image: UIImage(named: "bg") ?? UIImage()))
        arrayAudio.append(InfoAudio(image: UIImage(named: "bg-4") ?? UIImage()))
        arrayAudio.append(InfoAudio(image: UIImage(named: "bg-2") ?? UIImage()))
        arrayAudio.append(InfoAudio(image: UIImage(named: "bg-3") ?? UIImage()))
        var landings:[LandingSections] = [LandingSections]()
        landings.append(LandingSections(title: "Libraries",arrayLibrary: arrayLibrary, type: .library))
        landings.append(LandingSections(title: "Videos",arrayVideo: arrayvideo, type: .video))
        landings.append(LandingSections(title: "Audios",arrayAudio: arrayAudio, type: .audio))
        
        for item in landings {
            let landingView = ViewHorizontalSection.shared
            landingView.landing = item
            landingView.didSelectedDetailsTestimonios = {
                self.landingViewNavigator.moveToDetailTest(didAddedToCard: {
                    self.landingViewNavigator.moveToAddToCart()
                }) {
                    self.landingViewNavigator.moveToGift()
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
        if let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "featuredCell", at: index) as? FeaturedVideoCell {
            cell.detailFeature = arrayFeature[index]
            return cell
        }
        return FSPagerViewCell()
    }
}
extension LandingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayConnection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ConnectionsCell{
            cell.detailConnection = arrayConnection[indexPath.row]
            cell.cellType = .landing
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
// MARK: - Textfield Extension
extension LandingViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        landingViewNavigator.moveToSearch()
        return false
    }
}
