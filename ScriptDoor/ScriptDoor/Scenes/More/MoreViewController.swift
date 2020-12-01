//
//  MoreViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 28/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var moreTableView: UITableView!
    @IBOutlet private weak var viewFooter: UIView!
    
    // MARK: - Variable
    var arrayMore: [InfoMore] = []
    
    // MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Helper Method
    func prepareView() {
        moreTableView.tableFooterView = viewFooter
        arrayMore.append(InfoMore(moreButtonTitle: "WIPOD", moreButtonImage: "featherPen"))
        arrayMore.append(InfoMore(moreButtonTitle: "Private Library", moreButtonImage: "book"))
        arrayMore.append(InfoMore(moreButtonTitle: "Public Library", moreButtonImage: "bookOpen"))
        arrayMore.append(InfoMore(moreButtonTitle: "Analytics", moreButtonImage: "presentationAlt"))
        arrayMore.append(InfoMore(moreButtonTitle: "Supplementry Account", moreButtonImage: "badgeId"))
        arrayMore.append(InfoMore(moreButtonTitle: "Subscription Plans", moreButtonImage: "calendarAlt"))
        arrayMore.append(InfoMore(moreButtonTitle: "Wallet", moreButtonImage: "wallet"))
        arrayMore.append(InfoMore(moreButtonTitle: "Settings", moreButtonImage: "settings"))
    }
}

// MARK: - Extension TableView
extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getTableViewCell(cellID: MoreCell.self)
        cell?.detailMore = arrayMore[indexPath.row]
        return cell ?? UITableViewCell()
    }
}
