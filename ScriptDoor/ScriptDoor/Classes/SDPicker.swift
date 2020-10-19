//
//  SDPicker.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 12/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit


struct SDPickerData {
    var rowValue: String
}
enum SDPickerType {
    case none
    case selectRole
    case ProfileType
    case SelectYourIndustry
    case Country
    case AccountType
    // case hours
}
class SDPicker: UIView {
    // MARK: - Outlets
    @IBOutlet private weak var pickerView: UIPickerView!
    // MARK: - Variables
    private var arrayPickerValue = [[SDPickerData]]()
    var didPickerValueChange:((SDPickerData) -> Void)?
    var didSelectedTime:((SDPickerData,SDPickerData) -> Void)?
    private var pickerType: SDPickerType = SDPickerType.none
    var toolBar = UIToolbar()
    // MARK: - Lyfe Cycle
    override func didMoveToWindow() {
        super.didMoveToWindow()
        pickerMethods()
        //        if pickerType == .hours {
        //            let hours = pickerView.selectedRow(inComponent: 0)
        //            let amPm = pickerView.selectedRow(inComponent: 1)
        //            didSelectedTime?(arrayPickerValue[0][hours],arrayPickerValue[1][amPm])
        //        } else {
        
        
        //        }
    }
    @objc func onDoneButtonTapped() {
        //        textYourType.text = [self.selectedIndex]
        //        textYourType?.resignFirstResponder()
        toolBar.removeFromSuperview()
        //  picker.removeFromSuperview()
    }
    func pickerMethods() {
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .default
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.addSubview(toolBar)
    }
    static var shared: SDPicker {
        return (UINib(nibName: "SDPicker", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? SDPicker)!
    }
    
    // MARK: - Picker Show Methods
    func pickerWithData(data:[[SDPickerData]]) {
        arrayPickerValue.append(contentsOf: data)
        pickerView.reloadAllComponents()
    }
    func pickerWithType(type: SDPickerType) {
        arrayPickerValue.removeAll()
        pickerType = type
        switch type {
        case .selectRole:
            var arrayRole: [SDPickerData] = [SDPickerData]()
            let arrayRoleType:[String] = [ "FirstRole", "SecondRole", "ThirdRole"]
            for i in arrayRoleType {
                arrayRole.append(SDPickerData(rowValue: i ))
            }
            arrayPickerValue.append(arrayRole)
        case .ProfileType:
            var arrayType: [SDPickerData] = [SDPickerData]()
            let arrayProfileType:[String] = [ "ProfileType1", "ProfileType2", "ProfileType3"]
            for i in arrayProfileType {
                arrayType.append(SDPickerData(rowValue: i ))
            }
            arrayPickerValue.append(arrayType)
        case .SelectYourIndustry:
            var arrayIndu: [SDPickerData] = [SDPickerData]()
            let arrayInduType:[String] = [ "Industry1", "Industry2", "Industry3"]
            for i in arrayInduType {
                arrayIndu.append(SDPickerData(rowValue: i ))
            }
            arrayPickerValue.append(arrayIndu)
        case .AccountType:
                var arrayAccType: [SDPickerData] = [SDPickerData]()
                let arrayAccountType:[String] = [ "AccountType1", "AccountType2", "AccountType3"]
                for i in arrayAccountType {
                    arrayAccType.append(SDPickerData(rowValue: i ))
                }
                arrayPickerValue.append(arrayAccType)
        case .Country:
            var arrayCountry: [SDPickerData] = [SDPickerData]()
            let arrayCountryType:[String] = [ "Country1", "Country2", "Country3"]
            for i in arrayCountryType {
                arrayCountry.append(SDPickerData(rowValue: i ))
            }
            arrayPickerValue.append(arrayCountry)
        case .none: break
        }
        pickerView.reloadAllComponents()
    }
    func showPickerWith(view: UIView) {
        self.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 280)
        view.addSubview(self)
        UIView.animate(withDuration: 0.25) {
            self.frame.origin.y -= 280
        }
    }
    // MARK: - Action Methods
    @IBAction private func didTapOnCancel() { hide() }
    @IBAction private func didTapOnDone() {
        if pickerView.numberOfComponents > 0 {
            let rowIndex = pickerView.selectedRow(inComponent: 0)
            didPickerValueChange?(arrayPickerValue[0][rowIndex])
        }
        hide()
    }
    private func hide() {
        UIView.animate(withDuration: 0.25, animations: {
            self.frame.origin.y = (self.superview?.frame.height ?? 0)
        }) { (_) in
            self.removeFromSuperview()
        }
    }
}

// MARK: - Picker Datasource & Delegate
extension SDPicker: UIPickerViewDataSource , UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return arrayPickerValue.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPickerValue[component].count
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleString = NSAttributedString(string: arrayPickerValue[component][row].rowValue, attributes: [NSAttributedString.Key.font : UIFont(name: "CircularStd-Medium",
                                                                                                                                                  size: 14.0) ?? "",NSAttributedString.Key.foregroundColor: UIColor(red: 0.303, green: 0.303, blue: 0.303, alpha: 1)])
        return titleString
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        didPickerValueChange?(arrayPickerValue[component][row])
    }
}
