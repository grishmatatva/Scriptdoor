//
//  ViewHorizontalSection.swift
//  ScriptDoor
//
//  Created by pcq196 on 22/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView
enum SectionType {
    case library
    case video
    case audio
}
struct LandingSections {
    var title: String
    var arrayLibrary: [InfoLibrary] = []
    var arrayAudio: [InfoAudio] = []
    var arrayVideo: [InfoVideo] = []
    var type: SectionType
}

class ViewHorizontalSection: UIView {
    
    // MARK: - Outlets
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var viewPager: FSPagerView!
    
    // MARK: - variables
    var didSelectedDetailsTestimonios: (() -> ())?
    var landing: LandingSections? {
        didSet {
            labelTitle.text = landing?.title ?? ""
            viewPager.dataSource = self
            viewPager.delegate = self
            if landing?.type == SectionType.library {
                viewPager.register(UINib(nibName: "LibraryCell", bundle: nil), forCellWithReuseIdentifier: "LibraryCell")
                viewPager.itemSize = CGSize(width: 216, height: 316)
            } else if landing?.type == SectionType.audio {
                viewPager.register(UINib(nibName: "AudioCell", bundle: nil), forCellWithReuseIdentifier: "AudioCell")
                viewPager.itemSize = CGSize(width: 200, height: 232
                )
            } else  {
                viewPager.register(UINib(nibName: "VideoCell", bundle: nil), forCellWithReuseIdentifier: "VideoCell")
                viewPager.itemSize = CGSize(width: 240, height: 222)
            }
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
        if landing?.type == SectionType.library {
            return landing?.arrayLibrary.count ?? 0
        } else if landing?.type == SectionType.audio {
            return landing?.arrayAudio.count ?? 0
        } else {
            return landing?.arrayVideo.count ?? 0
        }
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        if landing?.type == SectionType.library {
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "LibraryCell", at: index) as? LibraryCell
            cell?.detailLibrary = landing?.arrayLibrary[index]
            return cell ?? FSPagerViewCell()
        } else if landing?.type == SectionType.audio {
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "AudioCell", at: index) as? AudioCell
            cell?.detailAudio = landing?.arrayAudio[index]
            return cell ?? FSPagerViewCell()
        } else {
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "VideoCell", at: index) as? VideoCell
            cell?.detailVideo = landing?.arrayVideo[index]
            return cell ?? FSPagerViewCell()
        }
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        didSelectedDetailsTestimonios?()
    }
}
