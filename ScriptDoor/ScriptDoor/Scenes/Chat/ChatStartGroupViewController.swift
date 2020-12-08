//
//  ChatStartGroupViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 02/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class ChatStartGroupViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var chatGroupStartCollection: UICollectionView!
    @IBOutlet private weak var chatGroupStartTableView: UITableView!
    @IBOutlet private weak var colectionViewConstraint: NSLayoutConstraint!
    
    // MARK: - Varibles
    var arrayGroupStart: [InfoGroupChat] = []
    var arrayGroupChat: [InfoGroupChat] = []
    lazy var viewNavigation: ChatStartGroupNavigation = ChatStartGroupNavigation(self)
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        chatGroupStartCollection.register(UINib(nibName: "ChatStartGroupCell", bundle: nil), forCellWithReuseIdentifier: "ChatStartGroupCell")
        chatGroupStartTableView.register(UINib(nibName: "ChatGroupStartTbCell", bundle: nil), forCellReuseIdentifier: "ChatGroupStartTbCell")
        arrayGroupChat.append(InfoGroupChat(id:1,image: UIImage(named: "bg-6"), name: "Patrick Jane", day: "connected a day ago"))
        arrayGroupChat.append(InfoGroupChat(id:2,image: UIImage(named: "bg-7"), name: "Mo Chun", day: "connected two days ago"))
        arrayGroupChat.append(InfoGroupChat(id:3,image: UIImage(named: "bg-8"), name: "Boris Ukhtomsky", day: "connected two days ago"))
        arrayGroupChat.append(InfoGroupChat(id:4,image: UIImage(named: "bg-9"), name: "Julian Gruber", day: "connected a day ago"))
        chatGroupStartTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 55, height: 75)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        chatGroupStartCollection.collectionViewLayout = layout
    }
    
    func tablePrepareView() {
        arrayGroupStart.removeAll()
        let array = arrayGroupChat.filter({$0.isSelected})
        if array.count > 0 {
            colectionViewConstraint.constant = 100
        } else {
            colectionViewConstraint.constant = 0
        }
        arrayGroupStart.append(contentsOf: array)
        chatGroupStartTableView.reloadData()
        chatGroupStartCollection.reloadData()
    }

    func collectionPrepareView() {
        arrayGroupChat.remove(at: 0)
    }
    
    func reloadGroupMembers(Id: Int) {
        for i in 0...arrayGroupChat.count - 1 {
            if arrayGroupChat[i].id == Id {
                arrayGroupChat[i].isSelected = false
                break
            }
        }
        tablePrepareView()
    }
    
    @IBAction private func didTapOnForward() {
        viewNavigation.moveToStartGroup(array: arrayGroupStart)
    }
}

// MARK: - Extension CollectionView
extension ChatStartGroupViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayGroupStart.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatStartGroupCell", for: indexPath) as? ChatStartGroupCell
        cell?.detailStartGroup = arrayGroupStart[indexPath.row]
        cell?.didTakeCancel = { (value) in
            self.reloadGroupMembers(Id: value)
        }
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - Tableview Extension
extension ChatStartGroupViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayGroupChat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getTableViewCell(cellID: ChatGroupStartTbCell.self)
        cell?.detailChat = arrayGroupChat[indexPath.row]
        cell?.didCheckBox = { value in
            self.arrayGroupChat[indexPath.row].isSelected = value
            self.tablePrepareView()
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.arrayGroupChat[indexPath.row].isSelected = !self.arrayGroupChat[indexPath.row].isSelected
        tablePrepareView()
    }
}
