//
//  UITableView+Extensions.swift
//  ScriptDoor
//
//  Created by PCQ187 on 24/11/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

extension UITableView {
    
    func getTableViewCell<T: UITableViewCell>(cellID: T.Type) -> T?{
        let cellIdenfier = String(describing: cellID.self)
        if let cell = self.dequeueReusableCell(withIdentifier: cellIdenfier) as? T{
            return cell
        }
        return nil
    }
}
