//
//  UIView+Extensions.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 07/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

@IBDesignable extension UIView {
    @IBInspectable var shadowColor: UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }
    @IBInspectable var shadowOffset: CGPoint {
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
    }
    @IBInspectable var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            self.clipsToBounds = cornerRadius > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable
      var borderWidth: CGFloat {
          get {
              return layer.borderWidth
          }
          set {
              layer.borderWidth = newValue
          }
      }

      @IBInspectable
      var borderColor: UIColor? {
          get {
              let color = UIColor.init(cgColor: layer.borderColor!)
              return color
          }
          set {
              layer.borderColor = newValue?.cgColor
          }
      }
}
