//
//  OnBoardingViewController.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 07/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var tableViewBoard: UITableView!
    
    // MARK: Variable
    private lazy var viewNavigator : OnBoardingViewNavigator = OnBoardingViewNavigator(self)
    var arrayBoard: [BoardData] = []
    
    // MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareView()
    }
    
    // MARK: - Helper Methods
    func prepareView()  {
         tableViewBoard.register(UINib(nibName: "BoardCell", bundle: nil), forCellReuseIdentifier: "BoardCell")
        arrayBoard.append(BoardData(image: UIImage(named: "Content"), title: "Create and Discover Content", subTitle: "Scriptdoor taps into the brains of writers, thinkers"))
        arrayBoard.append(BoardData(image: UIImage(named: "Connection"), title: "Make Connections", subTitle: "Scriptdoor taps into the brains of writers, thinkers"))
        arrayBoard.append(BoardData(image: UIImage(named: "Material"), title: "Buy and Sell Material", subTitle: "Scriptdoor taps into the brains of writers, thinkers"))
        
    }
    
    // MARK: - Action Methods
    @IBAction private func didTapOnSkip() { viewNavigator.moveToSignUp() }
}

// MARK: - Tableview Delegates
extension OnBoardingViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBoard.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.getTableViewCell(cellID: BoardCell.self) {
            cell.boardDetail = arrayBoard[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
