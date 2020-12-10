//
//  CreatePublicationViewController.swift
//  ScriptDoor
//
//  Created by pcq196 on 09/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class CreatePublicationViewController: UIViewController {
    
    @IBOutlet private weak var templateCollection: UICollectionView!
    
    var arrayTemplete:[PublicationTemplate] = [PublicationTemplate]()
    lazy var viewNavigator: CreatePublicationViewNavigator = CreatePublicationViewNavigator(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    private func prepareView() {
        templateCollection.register(UINib(nibName: "CreatePublicationTemplateCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        let layOut = UICollectionViewFlowLayout()
        let size:CGFloat =  (view.frame.size.width  / 2) - 32
        layOut.itemSize = CGSize(width: size, height: size)
        layOut.minimumInteritemSpacing = 0
        layOut.minimumInteritemSpacing = 0
        layOut.scrollDirection = .vertical
        templateCollection.collectionViewLayout = layOut
        arrayTemplete.append(PublicationTemplate(templateName: "Albums", image: UIImage(named: "mask1")!))
        arrayTemplete.append(PublicationTemplate(templateName: "Books", image: UIImage(named: "mask2")!))
        arrayTemplete.append(PublicationTemplate(templateName: "Magazines", image: UIImage(named: "mask3")!))
        arrayTemplete.append(PublicationTemplate(templateName: "Newspapers", image: UIImage(named: "mask4")!))
        arrayTemplete.append(PublicationTemplate(templateName: "Albums", image: UIImage(named: "mask5")!))
        arrayTemplete.append(PublicationTemplate(templateName: "Posters", image: UIImage(named: "mask6")!))
     
    }
    // MARK: - Action Methods
    @IBAction private func didOnBack() { viewNavigator.moveToPublicationOption() }
    
}
extension CreatePublicationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTemplete.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CreatePublicationTemplateCell
        cell?.template = arrayTemplete[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
}
