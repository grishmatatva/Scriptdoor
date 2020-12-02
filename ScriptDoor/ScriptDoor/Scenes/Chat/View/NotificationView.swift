//
//  NotificationView.swift
//  ScriptDoor
//
//  Created by PCQ187 on 01/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class NotificationView: UIView {

   
   static var shared: NotificationView { (UINib(nibName: "NotificationView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! NotificationView) }


}
