//
//  UIStoryboard+Extentions.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static var authontication: UIStoryboard {
        return UIStoryboard(name: "Authontication", bundle: nil)
    }
    
    static var landing: UIStoryboard {
        return UIStoryboard(name: "Landing", bundle: nil)
    }
    
    static var detailsTest: UIStoryboard {
        return UIStoryboard(name: "DetailTestimoials", bundle: nil)
    }
    static var cart: UIStoryboard {
        return UIStoryboard(name: "Cart", bundle: nil)
    }
    func getViewController<T: UIViewController>(type: T.Type) -> T? {
        let id = String(describing: type)
        return instantiateViewController(withIdentifier: id) as? T
    }
}

extension UINavigationController {

    func popToViewController(viewController: AnyClass, animation: Bool = true) {
        for vcrl in self.viewControllers {
            if vcrl.isKind(of: viewController) {
                self.popToViewController(vcrl, animated: animation)
                break
            }
        }
    }
    
    func pop(transitionType type: CATransitionType = .fade, duration: CFTimeInterval = 0.3) {
        self.addTransition(transitionType: type, duration: duration)
        self.popViewController(animated: false)
    }
    
    func viewController(ofClass: AnyClass) -> Bool {
        for vc in self.viewControllers {
            if vc.isKind(of: ofClass){
                return true
            }
        }
        return false
    }
    
    private func addTransition(transitionType type: CATransitionType = .fade, duration: CFTimeInterval = 0.3) {
          let transition = CATransition()
          transition.duration = duration
          transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
          transition.subtype = .fromRight
          transition.type = type
          self.view.layer.add(transition, forKey: nil)
      }
}
