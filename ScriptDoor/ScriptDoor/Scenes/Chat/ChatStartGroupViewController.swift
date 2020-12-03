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
    
    // MARK: - Varibles
    var arrayGroupStart: [InfoStartGroup] = []
    var arrayGroupChat: [InfoGroupChat] = []
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        chatGroupStartCollection.register(UINib(nibName: "ChatStartGroupCell", bundle: nil), forCellWithReuseIdentifier: "ChatStartGroupCell")
        chatGroupStartTableView.register(UINib(nibName: "ChatGroupStartTbCell", bundle: nil), forCellReuseIdentifier: "ChatGroupStartTbCell")
        arrayGroupStart.append(InfoStartGroup(image: UIImage(named: "bg-2"), name: "Patrick Jane"))
        arrayGroupStart.append(InfoStartGroup(image: UIImage(named: "bg-3"), name: "Mo Chun"))
        arrayGroupStart.append(InfoStartGroup(image: UIImage(named: "bg-4"), name: "Boris Ukhtomsky"))
        arrayGroupStart.append(InfoStartGroup(image: UIImage(named: "bg-5"), name: "Julian Gruber"))
        arrayGroupChat.append(InfoGroupChat(image: UIImage(named: "bg-6"), name: "Patrick Jane", day: "connected a day ago"))
        arrayGroupChat.append(InfoGroupChat(image: UIImage(named: "bg-7"), name: "Mo Chun", day: "connected two days ago"))
        arrayGroupChat.append(InfoGroupChat(image: UIImage(named: "bg-8"), name: "Boris Ukhtomsky", day: "connected two days ago"))
        arrayGroupChat.append(InfoGroupChat(image: UIImage(named: "bg-9"), name: "Julian Gruber", day: "connected a day ago"))
        chatGroupStartTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
}

// MARK: - Extension CollectionView
extension ChatStartGroupViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayGroupStart.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatStartGroupCell", for: indexPath) as? ChatStartGroupCell
        cell?.detailStartGroup = arrayGroupStart[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 55, height: 75)
        
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
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      self.arrayGroupChat[indexPath.row].isSelected = !self.arrayGroupChat[indexPath.row].isSelected
        chatGroupStartTableView.reloadData()
    }
    
}
