//
//  LibraryViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 06/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var musicCollectionView: UICollectionView!
    var arrayFeed: [InfoMusicColl] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepateView()
        // Do any additional setup after loading the view.
    }
    
    func prepateView() {
        arrayFeed.append(InfoMusicColl(image: UIImage(named: "bg-13") ?? UIImage()))
        arrayFeed.append(InfoMusicColl(image: UIImage(named: "bg-14") ?? UIImage()))
        arrayFeed.append(InfoMusicColl(image: UIImage(named: "bg-15") ?? UIImage()))
        arrayFeed.append(InfoMusicColl(image: UIImage(named: "bg-16") ?? UIImage()))
        musicCollectionView.register(UINib(nibName: "MusicCollCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        musicCollectionView.reloadData()
    }
}

extension LibraryViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFeed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MusicCollCell
        cell?.detailMusic = arrayFeed[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 248)
    }
}
