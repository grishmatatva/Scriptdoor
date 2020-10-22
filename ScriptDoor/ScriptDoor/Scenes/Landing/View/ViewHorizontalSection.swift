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
}
class ViewHorizontalSection: UIView {
    
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var viewPager: FSPagerView!
    var landing: LandingSections? {
        didSet {
            labelTitle.text = landing?.title ?? ""
            viewPager.dataSource = self
            viewPager.register(UINib(nibName: "LibraryCell", bundle: nil), forCellWithReuseIdentifier: "LibraryCell")
            viewPager.itemSize = CGSize(width: 180, height: 416)
            viewPager.reloadData()
        }
    }
    static var shared: ViewHorizontalSection {
        return (UINib(nibName: "ViewHorizontalSection", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? ViewHorizontalSection)!
    }
}
extension ViewHorizontalSection: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 10
    }
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "LibraryCell", at: index)
       
        return cell
        
    }
}
