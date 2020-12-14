//
//  WipodViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
enum WipodTab {
    case dashboard
    case collabration
}
class WipodViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var dashboardButton: UIButton!
    @IBOutlet private weak var collabrationButton: UIButton!
    @IBOutlet private weak var myContentButton: UIButton!
    @IBOutlet private weak var othersButton: UIButton!
    @IBOutlet private weak var publicationCollectionView: UICollectionView!
    @IBOutlet private weak var viewButtonIndicator: NSLayoutConstraint!
    @IBOutlet private weak var stackViewOptions: UIStackView!
    @IBOutlet private weak var addButton: UIButton!
    // MARK: - Variable
    private lazy var viewNavigator: WipodViewNavigator = WipodViewNavigator(self)
    var arrayFeed: [InfoPublicationColl] = []
    var selectTab: WipodTab = .dashboard
    
    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    private func prepareView() {
        arrayFeed.append(InfoPublicationColl(image: UIImage(named: "bg-3") ?? UIImage()))
        arrayFeed.append(InfoPublicationColl(image: UIImage(named: "bg-9") ?? UIImage()))
        arrayFeed.append(InfoPublicationColl(image: UIImage(named: "bg-10") ?? UIImage()))
        arrayFeed.append(InfoPublicationColl(image: UIImage(named: "bg-11") ?? UIImage()))
        arrayFeed.append(InfoPublicationColl(image: UIImage(named: "bg-12") ?? UIImage()))
        publicationCollectionView.register(UINib(nibName: "WipodPublicationCell", bundle: nil), forCellWithReuseIdentifier: "dashboardCell")
        publicationCollectionView.register(UINib(nibName: "WipodCollabrationCell", bundle: nil), forCellWithReuseIdentifier: "collabrationCell")
        tabTab(status: .dashboard)
        publicationCollectionView.reloadData()
        
    }
    private func tabTab(status: WipodTab)  {
        let layOut = UICollectionViewFlowLayout()
        let size:CGFloat = status == .dashboard ? 222.0 : 270.0
        layOut.itemSize = CGSize(width: (view.frame.size.width  / 2) - 36, height: size)
        layOut.minimumLineSpacing = 30
        layOut.minimumInteritemSpacing = 0
        layOut.scrollDirection = .vertical
        publicationCollectionView.collectionViewLayout = layOut
        selectTab = status
        publicationCollectionView.reloadData()
    }
    // MARK: - Action Methods
    @IBAction private func didTapOnBack() { viewNavigator.moveToMore() }
    @IBAction private func didSelectMyContentOrOrOther(sender: UIButton) {
        othersButton.borderWidth = 0
        myContentButton.borderWidth = 0
        othersButton.isSelected = false
        myContentButton.isSelected = false
        sender.borderWidth = 1
        sender.isSelected = true
    }
    @IBAction private func didSelectDashboardOrCollabration(sender: UIButton) {
        collabrationButton.isSelected = false
        dashboardButton.isSelected = false
        sender.isSelected = true
        if collabrationButton.isSelected {
            viewButtonIndicator.constant = 140
            addButton.isHidden = false
            stackViewOptions.isHidden = true
            tabTab(status: .collabration)
        } else {
            viewButtonIndicator.constant = 0
            addButton.isHidden = true
            stackViewOptions.isHidden = false
            tabTab(status: .dashboard)
        }
    }
    @IBAction private func didTapOnAdd() { viewNavigator.moveToNewPublication() }
}
extension WipodViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFeed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if selectTab == .dashboard {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dashboardCell", for: indexPath) as? WipodPublicationCell
            cell?.detailPublication = arrayFeed[indexPath.row]
            return cell ?? UICollectionViewCell()
        } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collabrationCell", for: indexPath) as? WipodCollabrationCell
            cell?.detailPublication = arrayFeed[indexPath.row]
            return cell ?? UICollectionViewCell()
        }
        
    }
}
