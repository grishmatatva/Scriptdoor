//
//  SignUpViewController.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var textUserName: UITextField!
    @IBOutlet private weak var textEmail: UITextField!
    @IBOutlet private weak var textPassword: UITextField!
    @IBOutlet private weak var textConfirmPassword: UITextField!
    
    // MARK: - Variable
    lazy var viewNavigation: SignUpNavigation = SignUpNavigation(self)
    
    // MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareView()
    }
    
    // MARK: - Action Method
    @IBAction private func didTapOnSignUp() {
        signUpUser()
    }
    
    @IBAction func didtapOnPasswordEye(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        textPassword.isSecureTextEntry = !textPassword.isSecureTextEntry
    }
    
    @IBAction private func didtapOnConfPasswordEye(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        textConfirmPassword.isSecureTextEntry = !textConfirmPassword.isSecureTextEntry
    }
    
    // MARK: - Helper Method
    func prepareView() {
        inActiveTextField()
    }
    
    private func inActiveTextField() {
        textEmail.backgroundColor = UIColor.appColors.inActiveTextField
        textUserName.backgroundColor = UIColor.appColors.inActiveTextField
        textConfirmPassword.backgroundColor = UIColor.appColors.inActiveTextField
        textPassword.backgroundColor = UIColor.appColors.inActiveTextField
        textEmail.borderColor = UIColor.clear
        textUserName.borderColor = UIColor.clear
        textConfirmPassword.borderColor = UIColor.clear
        textPassword.borderColor = UIColor.clear
    }
    
    private func signUpUser() {
        if validation() {
            viewNavigation.moveToSignUpAs()
        }
    }
    
    private func validation() -> Bool {
        if textUserName.text?.trimmedLength == 0  {
            Utility.shared.showAlert(title: "", message: "Please enter username", controller: self)
            return false
        } else if textEmail.validate(validationType: .email) == .blank {
            Utility.shared.showAlert(title: "", message: "Please enter email", controller: self)
            return false
        } else if textEmail.validate(validationType: .email) == .invalid {
            Utility.shared.showAlert(title: "", message: "Invalid email", controller: self)
            return false
        } else if (textPassword.text?.trimmedLength ?? 0) < 8 {
            Utility.shared.showAlert(title: "", message: "Password must be 8 character long", controller: self)
            return false
        } else if textPassword.validate(validationType: .password) == .invalid || textPassword.validate(validationType: .password) == .blank {
            Utility.shared.showAlert(title: "", message: "Invalid password", controller: self)
            return false
        } else if textPassword.validate(validationType: .spacialCharacter) == .notContainsSpacialCharacter {
            Utility.shared.showAlert(title: "", message: "Enter special character", controller: self)
            return false
        } else if textConfirmPassword.text != textPassword.text   {
            Utility.shared.showAlert(title: "", message: "Password and confirm password are not same", controller: self)
            return false
        }
        return true
    }
}

// MARK: - Extension Textfield
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        inActiveTextField()
        textField.backgroundColor = UIColor.white
        textField.borderColor = UIColor.black
        return true
    }
    
}
