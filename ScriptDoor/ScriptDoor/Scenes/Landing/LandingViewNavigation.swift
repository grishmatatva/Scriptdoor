//
//  LandingViewNavigation.swift
//  ScriptDoor
//
//  Created by PCQ187 on 06/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class LandingViewNavigation {
    
    // MARK: - Variable
    var viewController: LandingViewController
    init(_ controller: LandingViewController) { viewController = controller }
    
    // MARK: - Navigations
    func moveToAudio() {
        if let audioVc = UIStoryboard.landing.getViewController(type: AudioViewController.self ) {
            viewController.navigationController?.pushViewController(audioVc, animated: true)
        }
    }
    
    func moveToVideo() {
           if let audioVc = UIStoryboard.landing.getViewController(type: VideoViewController.self ) {
               viewController.navigationController?.pushViewController(audioVc, animated: true)
           }
       }
    
    func moveToLibrary() {
           if let audioVc = UIStoryboard.landing.getViewController(type: LibraryViewController.self ) {
               viewController.navigationController?.pushViewController(audioVc, animated: true)
           }
       }
}
