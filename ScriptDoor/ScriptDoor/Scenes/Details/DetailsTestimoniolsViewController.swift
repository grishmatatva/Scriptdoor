//
//  DetailsTestimoniolsViewController.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView

class DetailsTestimoniolsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var pageViewLibrarys: FSPagerView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    // MARK: - Variable
    lazy var viewNavigator: DetailsTestimoniolsViewNavigation = DetailsTestimoniolsViewNavigation(self)
    var didAddToCard:(() -> ())?
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareView()
    }
    
    private func prepareView() {
        scrollView.contentOffset.y = 0
        pageViewLibrarys.register(UINib(nibName: "RelatedBooksCell", bundle: nil), forCellWithReuseIdentifier: "RelatedBooksCell")
    }
    
    @IBAction private func didTapOnClear() {
        viewNavigator.backToLanding()
    }
    
    @IBAction private func didTapOnAddToCart() {
        viewNavigator.moveToCart {
            self.didAddToCard?()
        }
    }
    
}
// MARK: - PagerViewExtension
extension DetailsTestimoniolsViewController: FSPagerViewDataSource {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
       return 10
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        if let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "RelatedBooksCell", at: index) as? RelatedBooksCell {
            return cell
        }
        return FSPagerViewCell()
    }
}

