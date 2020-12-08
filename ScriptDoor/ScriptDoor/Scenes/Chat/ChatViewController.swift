//
//  ChatViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 30/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import SwiftEntryKit

class ChatViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var chatTableView: UITableView!
    
    // MARK: - Variable
    var arrayChat: [InfoChat] = []
    lazy var viewNavigation: ChatViewNavigation = ChatViewNavigation(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        arrayChat.append(InfoChat(image: UIImage(named: "bg-10"), name: "Patrick Jane", mess: "I remember everything mate. See you later"))
        arrayChat.append(InfoChat(image: UIImage(named: "bg-2"), name: "Mo Chun", mess: "It seems logical that the strategy of providing!"))
        arrayChat.append(InfoChat(image: UIImage(named: "bg-3"), name: "Boris Ukhtomsky", mess: "Analysis of foreign experience, as it is commo…"))
        arrayChat.append(InfoChat(image: UIImage(named: "bg-4"), name: "Julian Gruber", mess: "It seems logical that the strategy of providing!"))
        chatTableView.tableFooterView = UIView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let custView =  NotificationView.shared
            let attributes = EKAttributes()
            SwiftEntryKit.display(entry: custView, using: attributes)
        }
    }
    
    // MARK: - Action Methods
    @IBAction func didTapOnAdd() {
        viewNavigation.moveToGroup()
    }
    
}

// MARK: - Tableview Extension
extension ChatViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayChat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getTableViewCell(cellID: ChatCell.self)
        cell?.detailChat = arrayChat[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewNavigation.moveToChat()
    }
    
}
