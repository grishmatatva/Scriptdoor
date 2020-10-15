//
//  SignInViewController.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 14/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var textEmail: UITextField!
    @IBOutlet private weak var textPassword: UITextField!
    
    // MARK: - Variable
    lazy var viewNavigator: SignInNavigation = SignInNavigation(viewController: self)
    
    // MARK: - Life Cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        inActiveTextField()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Methods
    @IBAction private func didTapOnRememberButton(sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction private func didTapOnSignUp() {
        viewNavigator.MoveToSignUp()
    }
    
    @IBAction private func didTapOnSignIn() {
        if validation() {
            
        }
    }
    
    @IBAction private func didTapOnHidePassword(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        textPassword.isSecureTextEntry = !textPassword.isSecureTextEntry
    }
    
    // MARK: - Helper Methods
    private func inActiveTextField() {
        textEmail.backgroundColor = UIColor.appColors.inActiveTextField
        textPassword.backgroundColor = UIColor.appColors.inActiveTextField
        textEmail.borderColor = UIColor.clear
        textPassword.borderColor = UIColor.clear
    }
    
    private func validation() -> Bool {
        if textEmail.text?.trimmedLength == 0 && textEmail.text?.trimmedLength == 0   {
            Utility.shared.showAlert(title: "", message: "Please enter fields", controller: self)
            return false
        }
        return true
    }
}

// MARK: - Extension Textfield
extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        inActiveTextField()
        textField.backgroundColor = UIColor.white
        textField.borderColor = UIColor.black
        return true
    }
    
}
