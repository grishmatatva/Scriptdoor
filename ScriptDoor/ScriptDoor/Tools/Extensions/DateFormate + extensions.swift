//
//  DateFormate + extensions.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 12/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import Foundation

// MARK: - ENUM
enum TSDateFormate {
    case Dob
    
    var formateString : String {
        switch self {
        case .Dob:
            return "dd.MM.yyyy"
        }
    }
}

// MARK: - DATE EXTENSION
extension Date {
    func dateFormated(formate: TSDateFormate) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formate.formateString
        return formatter.string(from: self)
    }
}
