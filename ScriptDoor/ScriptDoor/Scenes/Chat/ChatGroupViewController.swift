//
//  ChatGroupViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 02/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class ChatGroupViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var chatGroupTableView: UITableView!
    
    // MARK: - Variable
    var arrayChat: [InfoChatGroup] = []
    lazy var viewNavigation: ChatGroupNavigation = ChatGroupNavigation(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatGroupTableView.register(UINib(nibName: "ChatGroupCell", bundle: nil), forCellReuseIdentifier: "ChatGroupCell")
        arrayChat.append(InfoChatGroup(image: UIImage(named: "bg-10"), name: "Patrick Jane", day: "connected a day ago"))
        arrayChat.append(InfoChatGroup(image: UIImage(named: "bg-2"), name: "Mo Chun", day: "connected two days ago"))
        arrayChat.append(InfoChatGroup(image: UIImage(named: "bg-3"), name: "Boris Ukhtomsky", day: "connected two days ago"))
        arrayChat.append(InfoChatGroup(image: UIImage(named: "bg-4"), name: "Julian Gruber", day: "connected two days ago"))
        arrayChat.append(InfoChatGroup(image: UIImage(named: "bg-5"), name: "Kaytlin Ryan Jacob", day: "connected a day ago"))
        chatGroupTableView.tableFooterView = UIView()
    }
    
    @IBAction private func didTapOnNewGroup() {
        viewNavigation.moveToStartGroup()
    }
}

// MARK: - Tableview Extension
extension ChatGroupViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayChat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getTableViewCell(cellID: ChatGroupCell.self)
        cell?.detailChat = arrayChat[indexPath.row]
        return cell ?? UITableViewCell()
    }
   
}
