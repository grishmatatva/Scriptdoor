//
//  EmailViewController.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 09/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var labelEmailDetail: UILabel!
    
    // MARK: - Variable
    lazy var viewNavigator: EmailViewNavigation = EmailViewNavigation(self)
    var accountType: SignUpAs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){ // change your delay here wo knha se ayy ga ? wo to ese hi rakh tha na
          // redirect to next vc
            self.viewNavigator.moveToInterast()
        }
    }
     
    func prepareView() {
        let attributedString = NSMutableAttributedString(string: "We sent an email to soumya.mittal@gmail.com. Check your inbox to set up your account.", attributes: [
          .font: UIFont(name: "CircularStd-Book", size: 16.0)!,
          .foregroundColor: UIColor(white: 155.0 / 255.0, alpha: 1.0)
        ])
        attributedString.addAttributes([
          .font: UIFont(name: "CircularStd-Bold", size: 16.0)!,
          .foregroundColor: UIColor(white: 20.0 / 255.0, alpha: 1.0)
        ], range: NSRange(location: 20, length: 23))
        labelEmailDetail.attributedText = attributedString
        
    }

}
