//
//  Validation.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

// MARK: - ENUMS
enum ValidationType {
    
    case blank
    case email
    case password
    case spacialCharacter
}

enum ValidationResult {
    
    case valid
    case invalid
    case blank
    case containSpace
    case notContainsSpacialCharacter
}

// MARK: - CLASS
class Validation: NSObject {
    
    // MARK: - VALIDATION METHOD
    class func isBlank(_ string: String?) -> ValidationResult {
        
        if string == nil {
            return .blank
        }
        guard (string?.trimmedLength ?? 0) > 0 else {
            return .blank
        }
        return .valid
    }
    
    class func validateEmail(_ email: String?, isRequire: Bool) -> ValidationResult {
        
        if email == nil {
            return .blank
        }
        guard isRequire == true && (email?.length ?? 0) > 0 else {
            return .blank
        }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return validateString(email ?? "", againstRegExp: emailRegex)
    }
    
    class func validatePassword(_ password: String?, isRequire: Bool) -> ValidationResult {
        
        if password == nil {
            return .blank
        }
        guard isRequire == true && (password?.length ?? 0) > 0 else {
            return .blank
        }
        guard password == password?.trimmed else {
            return .containSpace
        }
        let passwordRegex = "^(?=.*[a-z])(?=.*\\d)[0-9A-Za-z!@#$%^&*()_+-]{8,}"
        return validateString(password ?? "", againstRegExp: passwordRegex)
    }
    
    class func validateString(_ string: String, againstRegExp regExp: String) -> ValidationResult {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", regExp)
        if emailTest.evaluate(with: string) {
            return .valid
        } else {
            return .invalid
        }
    }
    
    class func validatePassword(_ string: String) -> ValidationResult {
        let regExp = "^(?=.*[A-Z])(?=.*[!@#$&*%])(?=.*[0-9])(?=.*[a-z]).{8,}$"
        let regExp1 = "^(?=.*[!@#$&*%])(?=.*[0-9])(?=.*[a-z]).{8,}$"
        let regExp2 = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}$"
        let regExp3 = "^(?=.*[A-Z])(?=.*[!@#$&*%])(?=.*[a-z]).{8,}$"
        let regExp4 = "^(?=.*[A-Z])(?=.*[!@#$&*%])(?=.*[0-9]).{8,}$"
        
        let test = NSPredicate(format: "SELF MATCHES %@", regExp)
        let test1 = NSPredicate(format: "SELF MATCHES %@", regExp1)
        let test2 = NSPredicate(format: "SELF MATCHES %@", regExp2)
        let test3 = NSPredicate(format: "SELF MATCHES %@", regExp3)
        let test4 = NSPredicate(format: "SELF MATCHES %@", regExp4)
        
        if (test.evaluate(with: string) == true ||  test1.evaluate(with: string) == true || test2.evaluate(with: string) == true || test3.evaluate(with: string) == true || test4.evaluate(with: string) == true) && string.trimmingCharacters(in: .whitespaces).count != 0 {
            return .valid
        } else {
            return .invalid
        }
    }
}

// MARK: - EXTENSION TEXTFIELD
extension UITextField {
    
    func validate(validationType type: ValidationType, getFocus focusOnError: Bool = false, alertMessage message: String = "") -> ValidationResult {
        var result: ValidationResult?
        
        switch type {
        case .blank:
            result = Validation.isBlank(text?.trimmed)
            return result!
        case .email:
            result = Validation.validateEmail(text?.trimmed, isRequire: true)
        case .password:
            result = Validation.validatePassword(text?.trimmed, isRequire: true)
        case .spacialCharacter:
            if let regex = try? NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpression.Options()) {
                if regex.firstMatch(in: self.text ?? "", options: [], range: NSRange(location: 0, length: self.text?.count ?? 0)) != nil {
                    print("could not handle special characters")
                    return .valid
                } else {
                    return .notContainsSpacialCharacter
                }
            }
            return .notContainsSpacialCharacter
        }
        if focusOnError == true {
            if result != .valid {
                becomeFirstResponder()
            }
        }
        if message.trimmedLength > 0 {
            // Show alert here
        }
        return result!
    }
}
