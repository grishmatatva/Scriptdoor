//
//  ChatDetailViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 07/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class ChatDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var detailCollectionView: UICollectionView!
    var arrayDetail: [InfoGroupChat] = []
    lazy var viewNaviation: ChatDetailNavigation = ChatDetailNavigation(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailCollectionView.register(UINib(nibName: "ChatStartGroupCell", bundle: nil), forCellWithReuseIdentifier: "ChatStartGroupCell")
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func didTapOnBack() {
        viewNaviation.backToChat()
    }
    
    @IBAction private func didTapOnCreate() {
        viewNaviation.backToCreate()
    }
}

// MARK: - Extension CollectionView
extension ChatDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDetail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatStartGroupCell", for: indexPath) as? ChatStartGroupCell
        cell?.detailStartGroup = arrayDetail[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
}
