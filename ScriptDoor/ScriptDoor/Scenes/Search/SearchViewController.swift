//
//  SearchViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 22/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class SearchViewController: UIViewController {
    
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
        let storyboard = UIStoryboard.search
            
            let headerController = storyboard
                .instantiateViewController(withIdentifier: "HeaderViewController")
            //EveryThingViewController
            let everyThingViewController = storyboard
                .instantiateViewController(withIdentifier: "EveryThingViewController")
            everyThingViewController.title = "Everything   "
            
            let publicationViewController = storyboard
                .instantiateViewController(withIdentifier: "PublicationViewController")
            publicationViewController.title = "   Publications"
            
            let videoViewController = storyboard
                .instantiateViewController(withIdentifier: "VideoViewController")
            videoViewController.title = "Videos"
            
            let audioViewController = storyboard
                .instantiateViewController(withIdentifier: "AudioViewController")
            audioViewController.title = "Music"
            
            let libraryViewController = storyboard
                .instantiateViewController(withIdentifier: "LibraryViewController")
            libraryViewController.title = "Libraries"
            
            let usersViewController = storyboard
                .instantiateViewController(withIdentifier: "UsersViewController")
            usersViewController.title = "Users"
            
            segmentController.delegate = self
            segmentController.headerViewController = headerController
            segmentController.segmentControllers = [everyThingViewController,
                                                    publicationViewController,videoViewController,audioViewController,libraryViewController,usersViewController]
            segmentController.headerViewHeight = 100.0
            segmentController.headerViewOffsetHeight = 31.0
            
            segmentController.segmentTitleColor = .black
            segmentController.segmentSelectedTitleColor = .black
        segmentController.selectedSegmentViewColor = UIColor.appColors.labelBlue
            segmentController.segmentTitleFont = UIFont.getSDBookFontsWith(size: 16)
            self.navigationController?.pushViewController(segmentController,
                                                          animated: false)
        
    }
}

// MARK: - Extension
extension SearchViewController: SJSegmentedViewControllerDelegate {
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
