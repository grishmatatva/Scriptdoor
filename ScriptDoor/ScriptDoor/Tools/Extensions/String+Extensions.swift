//
//  String+Extensions.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import Foundation

// MARK: - EXTENSION STRING
extension String {

    /// Returns trim string
    var trimmed: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    /// Returns length of string
    var length: Int {
        return self.count
    }

    /// Returns length of string after trim it
    var trimmedLength: Int {
        return self.trimmed.length
    }

    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }

    func containsIgnoringCase(find: String) -> Bool {
        return self.range(of: find, options: .caseInsensitive, range: nil, locale: nil) != nil
    }

    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
    
}

