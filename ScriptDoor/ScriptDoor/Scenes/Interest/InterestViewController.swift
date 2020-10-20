//
//  InterestViewController.swift
//  ScriptDoor
//
//  Created by PCQ185 on 11/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class InterestViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Variable
    var arrayInterates: [IntrestModel] = [IntrestModel]()
    lazy var viewNavigation: InterestNavigation = InterestNavigation(self)
    var accountType: SignUpAs?
    let names = ["Action","Comedy","Horror","Adventure","Horror","Action","Horror","Adventure","Action","Comedy","Horror","Adventure","Horror"]
    
    let directions:[BubbleDirection] = [.up,.topleft,.topRight,.down,.down,.down,.up,.up,.up,.up,.up,.up,.down,.down,.down]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        prepareView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Helper Methods
    private func prepareView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 125, height: 125)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    
    // MARK: - Action Methods
    @IBAction private func didTapOnNext() {
        if accountType == SignUpAs.invidual  {
            viewNavigation.moveToProfile()
        } else {
            viewNavigation.moveToBusinessProfile()
        }
    }
    
    @IBAction func didTapOnBack() {
        viewNavigation.backToSignUpAsAn()
    }
}

// MARK: - Extension Collection View
extension InterestViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? IntrestCell)!
        cell.direction = directions[indexPath.item]
        cell.text = names[indexPath.item]
        cell.didSelecte = { selected in
            
        }
        return cell
    }
}
