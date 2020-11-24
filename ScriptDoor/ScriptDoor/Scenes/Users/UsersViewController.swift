//
//  UsersViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 19/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var libraryTableView: UITableView!
    var arrayFeed: [InfoLibColl] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepateView()
        // Do any additional setup after loading the view.
    
    }
    
    func prepateView() {
        libraryTableView.tableFooterView = UIView()
        arrayFeed.append(InfoLibColl(image: UIImage(named: "bg-13") ?? UIImage()))
        arrayFeed.append(InfoLibColl(image: UIImage(named: "bg-14") ?? UIImage()))
        arrayFeed.append(InfoLibColl(image: UIImage(named: "bg-15") ?? UIImage()))
        arrayFeed.append(InfoLibColl(image: UIImage(named: "bg-16") ?? UIImage()))
        libraryTableView.reloadData()
    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getTableViewCell(cellID: LibraryTableCell.self)
        cell?.detailPublication = arrayFeed[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
}


