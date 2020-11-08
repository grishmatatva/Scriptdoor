//
//  ViewHorizontalSection.swift
//  ScriptDoor
//
//  Created by pcq196 on 22/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView
struct LandingSections {
    var title: String
    var arrayLibrary: [InfoLibrary] = []
}
class ViewHorizontalSection: UIView {
    
    // MARK: - Outlets
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var viewPager: FSPagerView!
    
    // MARK: - variables
    var landingViewNavigator: LandingViewNavigation?
    var landing: LandingSections? {
        didSet {
            labelTitle.text = landing?.title ?? ""
            viewPager.dataSource = self
            viewPager.delegate = self 
            viewPager.register(UINib(nibName: "LibraryCell", bundle: nil), forCellWithReuseIdentifier: "LibraryCell")
            viewPager.itemSize = CGSize(width: 180, height: 416)
            viewPager.reloadData()
        }
    }
    
    static var shared: ViewHorizontalSection {
        return (UINib(nibName: "ViewHorizontalSection", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? ViewHorizontalSection)!
    }
    
}

// MARK: - FSPagerView Extension
extension ViewHorizontalSection: FSPagerViewDataSource,FSPagerViewDelegate {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return landing?.arrayLibrary.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "LibraryCell", at: index) as? LibraryCell
        cell?.detailLibrary = landing?.arrayLibrary[index]
        return cell ?? FSPagerViewCell()
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        if landing?.title == "Libraries"{
            landingViewNavigator?.moveToLibrary()
        } else if landing?.title == "Videos" {
            landingViewNavigator?.moveToVideo()
        } else {
            landingViewNavigator?.moveToAudio()
        }
    }
}
