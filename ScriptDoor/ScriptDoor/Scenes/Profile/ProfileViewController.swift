//
//  ProfileViewController.swift
//  ScriptDoor
//
//  Created by PCQ185 on 10/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var textSelectYourRole: UITextField!
    @IBOutlet private weak var textDateOfBirth: UITextField!
    @IBOutlet private weak var textYourCity: UITextField!
    @IBOutlet private weak var textYourType: UITextField!
    @IBOutlet private weak var imageProfile : UIImageView!
    @IBOutlet private weak var progressView : NSLayoutConstraint!
    
    var datePickerView = UIDatePicker()
    var selectedIndex :Int = 0
    var selectedDate : Date? = nil
    let picker = SDPicker.shared
    lazy var viewNavigation: ProfileViewNavigation = ProfileViewNavigation(viewController: self)
    
    // MARK: - Life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    // MARK: - Helper Method
    func prepareView() {
        inActiveTextField()
        textDateOfBirth.inputView = datePickerView
        dateFormate()
        UIView.animate(withDuration: 1.00) {
            self.progressView.constant = UIScreen.main.bounds.width
        }
    }
    
    private func updateDateToFields() {
        selectedDate = datePickerView.date
        textDateOfBirth.text = selectedDate?.dateFormated(formate: .Dob)
    }
    
    private func dateFormate() {
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        
        components.year = 0
        let maxDate = calendar.date(byAdding: components, to: currentDate)!
        
        components.year = -25
        let minDate = calendar.date(byAdding: components, to: currentDate)!
        
        datePickerView.minimumDate = minDate
        datePickerView.maximumDate = maxDate
        datePickerView.datePickerMode = .date
        datePickerView.addTarget(self, action: #selector(handleDatePicker), for: UIControl.Event.valueChanged)
        textDateOfBirth.addCancelDoneOnKeyboardWithTarget(self, cancelAction: #selector(handleCancelEvent), doneAction: #selector(handleDoneEvent))
        textDateOfBirth.addCancelDoneOnKeyboardWithTarget(self, cancelAction: #selector(handleCancelEvent), doneAction: #selector(handleDoneEvent))
    }
    
    private func inActiveTextField() {
        textSelectYourRole.backgroundColor = UIColor.appColors.inActiveTextField
        textDateOfBirth.backgroundColor = UIColor.appColors.inActiveTextField
        textYourCity.backgroundColor = UIColor.appColors.inActiveTextField
        textYourType.backgroundColor = UIColor.appColors.inActiveTextField
        textSelectYourRole.borderColor = UIColor.clear
        textDateOfBirth.borderColor = UIColor.clear
        textYourCity.borderColor = UIColor.clear
        textYourType.borderColor = UIColor.clear
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
    
    private func validation() -> Bool {
        if textSelectYourRole.text?.trimmedLength == 0 || textYourCity.text?.trimmedLength == 0 || textYourType.text?.trimmedLength == 0 || textDateOfBirth.text?.trimmedLength == 0  {
            Utility.shared.showAlert(title: "", message: "Please enter all Fields", controller: self)
            return false
        }
        return true
    }
    
    // MARK: - CUSTOM ACTION METHODS
    @objc private func handleDatePicker() { updateDateToFields() }
    
    @objc private func handleDoneEvent() {
        textDateOfBirth.resignFirstResponder()
        updateDateToFields()
    }
    
    @objc private func handleCancelEvent() {
        datePickerView.date = selectedDate ?? Date()
        textDateOfBirth.resignFirstResponder()
    }
    
    // MARK: - Action Methods
    @IBAction func didTapOnButtonYourType(_ sender: UIButton) {
        picker.pickerWithType(type: .ProfileType)
        picker.didPickerValueChange = { val in
            print(val)
            self.textYourType.text = val.rowValue
        }
        picker.showPickerWith(view: view)
    }
    
    @IBAction func didTapOnButtonSelectYourRoll(_ sender: UIButton) {
        let profilePicker = SDPicker.shared
        profilePicker.pickerWithType(type: .selectRole)
        profilePicker.didPickerValueChange = { val in
            print(val)
            self.textSelectYourRole.text = val.rowValue
        }
        profilePicker.showPickerWith(view: view)
    }
    
    @IBAction func addImageButton(sender : AnyObject) {
        self.funcActionImage(title: "OPTION", message: "")
    }
    
    @IBAction func didTapOnBack() {
        viewNavigation.backToInterest()
    }
    
    @IBAction func didTapOnNext() {
        if validation() {
            viewNavigation.moveToExplore()
            
        }
    }
}
// MARK: - Extension Textfield
extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        inActiveTextField()
        textField.backgroundColor = UIColor.white
        textField.borderColor = UIColor.black
        return true
    }
}

// MARK: - Extension ImagePicker
extension ProfileViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let selectedImage = info[.editedImage] as? UIImage
        imageProfile.image = selectedImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
