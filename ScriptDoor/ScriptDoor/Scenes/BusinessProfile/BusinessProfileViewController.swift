//
//  BusinessProfileViewController.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 16/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class BusinessProfileViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var textBusinessname: UITextField!
    @IBOutlet private weak var textYourIndustry: UITextField!
    @IBOutlet private weak var textCountry: UITextField!
    @IBOutlet private weak var textAccountType: UITextField!
    @IBOutlet private weak var imageProfile : UIImageView!
    
    let picker = SDPicker.shared
    
    // MARK: - Life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    // MARK: - Helper Method
    func prepareView() {
        inActiveTextField()
    }
    
    private func inActiveTextField() {
        textBusinessname.backgroundColor = UIColor.appColors.inActiveTextField
        textYourIndustry.backgroundColor = UIColor.appColors.inActiveTextField
        textCountry.backgroundColor = UIColor.appColors.inActiveTextField
        textAccountType.backgroundColor = UIColor.appColors.inActiveTextField
        textBusinessname.borderColor = UIColor.clear
        textYourIndustry.borderColor = UIColor.clear
        textCountry.borderColor = UIColor.clear
        textAccountType.borderColor = UIColor.clear
    }
    
    func funcActionImage(title: String, message: String) {
        let alertControl = UIAlertController(title: title, message:message, preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { (action) in
            self.showGallery()
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.showMyCamera()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            print("Cancel Action")
        }
        alertControl.addAction(galleryAction)
        alertControl.addAction(cameraAction)
        alertControl.addAction(cancelAction)
        self.present(alertControl, animated: true, completion: nil)
    }
    func showGallery() {
        let imagePicker = UIImagePickerController()
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext;
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        imagePicker.preferredContentSize = CGSize(width: 1, height: 5)
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func showMyCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            Utility.shared.showAlert(title: "Camera Can't Open", message: "Camera not supported in simulator", controller: self)
        }
    }
    
    // MARK: - Action Methods
    @IBAction func didTapOnButtonIndustry(_ sender: UIButton) {
        picker.pickerWithType(type: .SelectYourIndustry)
        picker.didPickerValueChange = { val in
            print(val)
            self.textYourIndustry.text = val.rowValue
        }
        picker.showPickerWith(view: view)
    }
    
    @IBAction func didTapOnButtonSelectYourCountry(_ sender: UIButton) {
        let profilePicker = SDPicker.shared
        profilePicker.pickerWithType(type: .Country)
        profilePicker.didPickerValueChange = { val in
            print(val)
            self.textCountry.text = val.rowValue
        }
        profilePicker.showPickerWith(view: view)
    }
    
    @IBAction func didTapOnButtonSelectAccountType(_ sender: UIButton) {
        let profilePicker = SDPicker.shared
        profilePicker.pickerWithType(type: .AccountType)
        profilePicker.didPickerValueChange = { val in
            print(val)
            self.textAccountType.text = val.rowValue
        }
        profilePicker.showPickerWith(view: view)
    }
    
    @IBAction func AddImageButton(sender : AnyObject) {
        self.funcActionImage(title: "OPTION", message: "")
    }
}

// MARK: - Extension Textfield
extension BusinessProfileViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        inActiveTextField()
        textField.backgroundColor = UIColor.white
        textField.borderColor = UIColor.black
        return true
    }
}

// MARK: - Extension ImagePicker
extension BusinessProfileViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let selectedImage = info[.editedImage] as? UIImage
        imageProfile.image = selectedImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}


