//
//  MyRecentActivityViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 24/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class MyRecentActivityViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var recentTableView: UITableView!
    var arrayRecent: [InfoRecent] = []
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayRecent.append(InfoRecent(recImage: UIImage(named: "bg-2"), recName:"Patrick Jane" , workName:"Writer" ))
        arrayRecent.append(InfoRecent(recImage: UIImage(named: "bg-3"), recName:"Kaytlin Ryan Jacob" , workName:"Writer" ))
        arrayRecent.append(InfoRecent(recImage: UIImage(named: "bg-4"), recName:"Šimon Kováč" , workName:"Youtuber" ))
        arrayRecent.append(InfoRecent(recImage: UIImage(named: "bg-5"), recName:"Dai Jiang" , workName:"Photographer" ))
        arrayRecent.append(InfoRecent(recImage: UIImage(named: "bg-6"), recName:"Gibby Radki" , workName:"DJ" ))
        recentTableView.tableFooterView = UIView()
        recentTableView.reloadData()
        // Do any additional setup after loading the view.
    }
}

// MARK: - TableView Extension
extension MyRecentActivityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayRecent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getTableViewCell(cellID: MyRecentCell.self)
        cell?.detailRecent = arrayRecent[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.arrayRecent[indexPath.row].isSelected = !self.arrayRecent[indexPath.row].isSelected
        recentTableView.reloadData()
    }

}
