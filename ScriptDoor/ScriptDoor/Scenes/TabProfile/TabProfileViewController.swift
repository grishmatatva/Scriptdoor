//
//  TabProfileViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 24/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class TabProfileViewController: UIViewController {
    
    // MARK: - Variable
    let segmentController = SJSegmentedViewController()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSearchSegment()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Helper Method
    private func prepareSearchSegment() {
        if  let storyboard = self.storyboard {
            
            let headerController = storyboard
                .instantiateViewController(withIdentifier: "ProfileHeaderViewController")
            //EveryThingViewController
            let everyThingViewController = storyboard
                .instantiateViewController(withIdentifier: "MyRecentActivityViewController")
            everyThingViewController.title = "My Recent Activities   "
            
            let publicationViewController = storyboard
                .instantiateViewController(withIdentifier: "MyConnectionsViewController")
            publicationViewController.title = "   My Connections"
            
            let videoViewController = storyboard
                .instantiateViewController(withIdentifier: "MySubscribersViewController")
            videoViewController.title = "My Subscribers"
            
            let audioViewController = storyboard
                .instantiateViewController(withIdentifier: "MySubscribingViewController")
            audioViewController.title = "My Subscribing"
            
            segmentController.delegate = self
            segmentController.headerViewController = headerController
            segmentController.segmentControllers = [everyThingViewController,
                                                    publicationViewController,videoViewController,audioViewController]
            segmentController.headerViewHeight = 620.0
            segmentController.headerViewOffsetHeight = 31.0
            
            segmentController.segmentTitleColor = .black
            segmentController.segmentSelectedTitleColor = .black
            segmentController.selectedSegmentViewColor = UIColor.appColors.labelBlue
            segmentController.segmentTitleFont = UIFont.getSDBookFontsWith(size: 16)
            self.navigationController?.pushViewController(segmentController,
                                                          animated: false)
        }
    }
}

// MARK: - Extension
extension TabProfileViewController: SJSegmentedViewControllerDelegate {
    func didMoveToPage(_ controller: UIViewController, segment: SJSegmentTab?, index: Int) {
        segment?.frame.size.width = 110
        //segmentController.segmentTitleFont = UIFont(name: "CircularStd-Book", size: 16)!
        segmentController.segmentTitleFont = UIFont.getSDBookFontsWith(size: 16)
        for item in segmentController.view.subviews.first?.subviews.last?.subviews.first?.subviews ?? []{
            (item.subviews.first as? UIButton)?.titleLabel?.font =  UIFont.getSDBookFontsWith(size: 16)
            //(item.subviews.first as? UIButton)?.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 36)
            //(item.subviews.first as? UIButton)?.titleLabel?.frame.size.width = 80
            //(item.subviews.first as? UIButton)?.frame.size =
            if let bSize = (item.subviews.first as? UIButton) {
                let newSize = bSize.intrinsicContentSize
                (item.subviews.first as? UIButton)?.frame = CGRect.init(x: 0, y: 0, width: newSize.width, height: newSize.height)
            }
        }
        segment?.titleFont(UIFont.getSDBoldFontsWith(size: 16))
    }
}


