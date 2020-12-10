//
//  ProfileRequestViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class ProfileRequestViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var requestTableView: UITableView!
    @IBOutlet private weak var headerView: UIView!
    
    // MARK: - Variables
    lazy var viewNavigation: ProfileRequestViewNavigation = ProfileRequestViewNavigation(viewController: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        requestTableView.tableHeaderView = headerView
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCamcel() {
        viewNavigation.backToRequest()
    }

}

// MARK: - Extention TableView
extension ProfileRequestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getTableViewCell(cellID: RequestCell.self)
        return cell ?? UITableViewCell()
    }
   
}
