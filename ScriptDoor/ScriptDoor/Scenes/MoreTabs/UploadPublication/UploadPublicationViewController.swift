//
//  UploadPublicationViewController.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class UploadPublicationViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var publicationsTableView: UITableView!
    @IBOutlet private weak var footerView: UIView!
    
    // MARK: - Variables
    lazy var viewNavigator: UploadPublicationNavigator =  UploadPublicationNavigator(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    func prepareView() {
        publicationsTableView.tableFooterView = footerView
    }
    // MARK: - Action Methods
    @IBAction private func didOnBack() { viewNavigator.moveToPublicationOption() }

}
extension UploadPublicationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getTableViewCell(cellID: UploadPublicationCell.self)
        cell?.didExpandedCell = { expand in
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        return cell ?? UITableViewCell()
    }
}
