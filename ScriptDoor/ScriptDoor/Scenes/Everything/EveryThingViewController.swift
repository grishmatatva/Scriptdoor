//
//  EveryThingViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 18/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import FSPagerView

class EveryThingViewController: UIViewController {
    
    @IBOutlet private weak var viewPublication: FSPagerView!
    @IBOutlet private weak var viewVideo: FSPagerView!
    @IBOutlet private weak var viewMusic: FSPagerView!
    @IBOutlet private weak var viewLibrary: FSPagerView!
    @IBOutlet private weak var viewUsers: FSPagerView!
    var arrayPublication: [InfoPublication] = []
    var arrayUser: [InfoConnection] = []
    var arrayLibrary: [InfoLibrary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    // MARK: - Helper Method
    private func prepareView() {
        viewPublication.dataSource = self
        viewPublication.register(UINib(nibName: "PublicationCell", bundle: nil), forCellWithReuseIdentifier: "publicationCell")
        viewVideo.register(UINib(nibName: "LibraryCell", bundle: nil), forCellWithReuseIdentifier: "libraryCell")
        viewMusic.register(UINib(nibName: "LibraryCell", bundle: nil), forCellWithReuseIdentifier: "libraryCell")
        viewLibrary.register(UINib(nibName: "LibraryCell", bundle: nil), forCellWithReuseIdentifier: "libraryCell")
        viewUsers.register(UINib(nibName: "ConnectionsCell", bundle: nil), forCellWithReuseIdentifier: "connectionsCell")
        viewUsers.itemSize = CGSize(width: 201, height: 229)
        viewPublication.itemSize = CGSize(width: 216, height: 301)
        viewVideo.itemSize = CGSize(width: 216, height: 400)
        viewMusic.itemSize = CGSize(width: 216, height: 400)
        viewLibrary.itemSize = CGSize(width: 216, height: 400)
        viewPublication.reloadData()
        arrayLibrary.append(InfoLibrary(image: UIImage(named: "bg-13") ?? UIImage(), videoImage:  UIImage()))
        arrayLibrary.append(InfoLibrary(image: UIImage(named: "bg-14") ?? UIImage(), videoImage:  UIImage()))
        arrayLibrary.append(InfoLibrary(image: UIImage(named: "bg-15") ?? UIImage(), videoImage:  UIImage()))
        arrayLibrary.append(InfoLibrary(image: UIImage(named: "bg-16") ?? UIImage(), videoImage:  UIImage()))
        arrayUser.append(InfoConnection(image: UIImage(named: "connection") ?? UIImage()))
        arrayUser.append(InfoConnection(image: UIImage(named: "bg-9") ?? UIImage()))
        arrayUser.append(InfoConnection(image: UIImage(named: "bg-10") ?? UIImage()))
        arrayUser.append(InfoConnection(image: UIImage(named: "bg-11") ?? UIImage()))
        arrayUser.append(InfoConnection(image: UIImage(named: "bg-12") ?? UIImage()))
        arrayPublication.append(InfoPublication(image: UIImage(named: "bg-3") ?? UIImage()))
        arrayPublication.append(InfoPublication(image: UIImage(named: "bg-9") ?? UIImage()))
        arrayPublication.append(InfoPublication(image: UIImage(named: "bg-10") ?? UIImage()))
        arrayPublication.append(InfoPublication(image: UIImage(named: "bg-11") ?? UIImage()))
        arrayPublication.append(InfoPublication(image: UIImage(named: "bg-12") ?? UIImage()))
    }
}

// MARK: - PagerViewExtension
extension EveryThingViewController: FSPagerViewDataSource {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        if pagerView == viewPublication {
            return arrayPublication.count
        } else if pagerView == viewUsers {
            return arrayUser.count
        } else {
            return arrayLibrary.count
        }
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        if pagerView == viewUsers {
            if let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "connectionsCell", at: index) as? ConnectionsCell {
                cell.detailConnection = arrayUser[index]
                return cell
            }
        } else if pagerView == viewPublication {
            if let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "publicationCell", at: index) as? PublicationCell {
                cell.detailPublication = arrayPublication[index]
                return cell
            }
        } else {
            if let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "libraryCell", at: index) as? LibraryCell {
                cell.detailLibrary = arrayLibrary[index]
                return cell
            }
        }
        return FSPagerViewCell()
    }
}
