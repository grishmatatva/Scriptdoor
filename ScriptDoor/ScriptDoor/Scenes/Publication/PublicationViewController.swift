//
//  PublicationViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 19/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class PublicationViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var publicationCollectionView: UICollectionView!
    var arrayFeed: [InfoPublicationColl] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepateView()
        // Do any additional setup after loading the view.
    }
    
    func prepateView() {
        arrayFeed.append(InfoPublicationColl(image: UIImage(named: "bg-3") ?? UIImage()))
        arrayFeed.append(InfoPublicationColl(image: UIImage(named: "bg-9") ?? UIImage()))
        arrayFeed.append(InfoPublicationColl(image: UIImage(named: "bg-10") ?? UIImage()))
        arrayFeed.append(InfoPublicationColl(image: UIImage(named: "bg-11") ?? UIImage()))
        arrayFeed.append(InfoPublicationColl(image: UIImage(named: "bg-12") ?? UIImage()))
        publicationCollectionView.register(UINib(nibName: "PublicationCollectionCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        publicationCollectionView.reloadData()
    }
}

extension PublicationViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFeed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PublicationCollectionCell
        cell?.detailPublication = arrayFeed[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 342)
    }
}
