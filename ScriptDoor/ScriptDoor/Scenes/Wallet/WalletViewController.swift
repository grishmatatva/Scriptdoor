//
//  WalletViewController.swift
//  ScriptDoor
//
//  Created by pcq196 on 10/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class WalletViewController: UIViewController {

    @IBOutlet private weak var transactionView: UIView!
    private let segmentController = SJSegmentedViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    private func prepareView() {
       // prepareSearchSegment()
    }
    private func prepareSearchSegment() {
            
            let headerController1 = UIStoryboard.wallet.getViewController(type: TransactionViewController.self)!
            headerController1.title = "All"
            let headerController2 = UIStoryboard.wallet.getViewController(type: TransactionViewController.self)!
            headerController2.title = "Debit"
            let headerController3 = UIStoryboard.wallet.getViewController(type: TransactionViewController.self)!
            headerController3.title = "Credit"
            segmentController.delegate = self
            
            segmentController.segmentControllers = [headerController1,headerController2,headerController3]
            segmentController.headerViewHeight = 100.0
            segmentController.headerViewOffsetHeight = 0
            segmentController.segmentTitleColor = .black
            segmentController.segmentSelectedTitleColor = .black
            segmentController.selectedSegmentViewColor = UIColor.appColors.labelBlue
            segmentController.segmentTitleFont = UIFont.getSDBookFontsWith(size: 16)
            segmentController.view.frame = transactionView.bounds
            transactionView.addSubview(segmentController.view)
            self.addChild(segmentController)
            segmentController.didMove(toParent: self)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - Extension
extension WalletViewController: SJSegmentedViewControllerDelegate {
    func didMoveToPage(_ controller: UIViewController, segment: SJSegmentTab?, index: Int) {
        segment?.frame.size.width = 110
        //segmentController.segmentTitleFont = UIFont(name: "CircularStd-Book", size: 16)!
        segmentController.segmentTitleFont = UIFont.getSDBookFontsWith(size: 16)
        for item in segmentController.view.subviews.first?.subviews.last?.subviews.first?.subviews ?? []{
            (item.subviews.first as? UIButton)?.titleLabel?.font =  UIFont.getSDBookFontsWith(size: 16)
            if let bSize = (item.subviews.first as? UIButton) {
                let newSize = bSize.intrinsicContentSize
                (item.subviews.first as? UIButton)?.frame = CGRect.init(x: 0, y: 0, width: newSize.width, height: newSize.height)
            }
        }
        segment?.titleFont(UIFont.getSDBoldFontsWith(size: 16))
    }
}
