//
//  MyRecentActivityViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 24/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import EzPopup

class MyRecentActivityViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var recentTableView: UITableView!
    @IBOutlet private weak var footerView: UIView!
    
    var arrayRecent: [InfoRecent] = []
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayRecent.append(InfoRecent(recImage: UIImage(named: "bg-2"), recName:"Patrick Jane" , workName:"Writer" ))
        arrayRecent.append(InfoRecent(recImage: UIImage(named: "bg-3"), recName:"Kaytlin Ryan Jacob" , workName:"Writer" ))
        arrayRecent.append(InfoRecent(recImage: UIImage(named: "bg-4"), recName:"Šimon Kováč" , workName:"Youtuber" ))
        arrayRecent.append(InfoRecent(recImage: UIImage(named: "bg-5"), recName:"Dai Jiang" , workName:"Photographer" ))
        arrayRecent.append(InfoRecent(recImage: UIImage(named: "bg-6"), recName:"Gibby Radki" , workName:"DJ" ))
        recentTableView.tableFooterView = footerView
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
        cell?.didMessageChange = { (value,button) in
            if value == true {
                if let contentVC = UIStoryboard.profile.getViewController(type: PopUpViewController.self) {
                    contentVC.modalPresentationStyle = .popover
                    contentVC.preferredContentSize = CGSize(width: 110, height: 166)
                    if let popupVC = contentVC.popoverPresentationController {
                        popupVC.permittedArrowDirections = UIPopoverArrowDirection(rawValue:0)
                        popupVC.sourceView = button
                        popupVC.delegate = self
                      self.present(contentVC, animated: true)
                    }
                }
                self.recentTableView.reloadData()
            }
        }
        return cell ?? UITableViewCell()
    }
}
extension MyRecentActivityViewController: UIPopoverPresentationControllerDelegate, UINavigationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    //UIPopoverPresentationControllerDelegate
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
}
