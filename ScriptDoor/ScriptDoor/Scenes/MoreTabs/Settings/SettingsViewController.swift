//
//  SettingsViewController.swift
//  ScriptDoor
//
//  Created by pcq196 on 11/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
enum SDSettings {
    
    static let type1: [SDSettings] = [
        SDSettings.discoverability,
        SDSettings.sendMessage,
        SDSettings.reciveGifts,
        SDSettings.showSubcriber,
        SDSettings.geoGraphical,
        SDSettings.emailUpdate,
        SDSettings.notification,
        SDSettings.privateAccount,
        SDSettings.publicationCount
    ]
    static let type2: [SDSettings] = [
        SDSettings.friendRequests,
        SDSettings.connections
    ]
    static let type3: [SDSettings] = [
           SDSettings.changePassword,
           SDSettings.manageAdvertisements
       ]
    static let type4: [SDSettings] = [
        SDSettings.deActiveAccount,
        SDSettings.requestVerification,
        SDSettings.blockAccount,
        SDSettings.mutedAccounts
    ]
    case discoverability
    case sendMessage
    case reciveGifts
    case showSubcriber
    case geoGraphical
    case emailUpdate
    case notification
    case privateAccount
    case publicationCount
    case friendRequests
    case connections
    case changePassword
    case manageAdvertisements
    case deActiveAccount
    case requestVerification
    case blockAccount
    case mutedAccounts
    
    
    var title: String {
        switch self {
        case .discoverability: return "Discoverability"
        case .sendMessage: return "Allow users to send message"
        case .reciveGifts: return "Recieve gifts or token transfer"
        case .showSubcriber: return "Show subscriber count to public"
        case .geoGraphical: return "Geographical location"
        case .emailUpdate: return "Email updates"
        case .notification: return "Notifications"
        case .privateAccount: return "Private account"
        case .friendRequests: return "Friend Requests"
        case .connections: return "Connections"
        case .changePassword: return "Change Password"
        case .publicationCount: return "Publication count"
        case .manageAdvertisements: return "Manage own advertisements"
        case .deActiveAccount: return "Deactivate Account"
        case .requestVerification: return "Request Verification"
        case .blockAccount: return "Blocked Accounts"
        case .mutedAccounts: return "Muted Accounts"
        }
    }
    var description: String {
        switch self {
        case .discoverability:
            return "If diabled the profile won’t appear in search or anywhere"
        case .sendMessage:
            return "If disabled, the connection won’t be allowed to send messages"
        case .reciveGifts:
            return "Allow to recieve gifts or token transfer"
        case .showSubcriber:
            return "Show subscriber count to public"
        case .geoGraphical:
            return "Allow users to see your geographical location"
        case .emailUpdate:
            return "All the promotional email push or mobile push notifications would be sent"
        case .notification:
            return "Recieve notifications from Scriptdoor on daily activities"
        case .privateAccount:
            return "Only my connections would be able to see my profile"
        case .friendRequests:
            return "Friend Requests"
        case .connections: return "Who can see your connections?"
        case .changePassword: return "Click to change your password"
        case .publicationCount: return "Only my connections would be able to see my publications"
        case .manageAdvertisements: return "Allow users to advertise on your profile"
        case .deActiveAccount: return "Click the button to deactivate your account"
        case .requestVerification: return "Verification allows your followers to know that your acount is authentic"
        case .blockAccount: return "Click the button to view account blocked by you"
        case .mutedAccounts: return "Click the button to view account muted by you"
        }
    }
    var type2Name: String {
        switch self {
        case .connections: return "Friends"
        case .friendRequests: return "Friends of Friends"
        default: return ""
        }
    }
}
class SettingsViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet private weak var settingsView: UIStackView!
    // MARK: - Variable
    lazy var viewNavigator: SettingViewNavigator = SettingViewNavigator(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    private func prepareView() {
        getSettings()
    }
    func getSettings() {
        let settings =  SDSettings.type1.map { (item) -> SettingsType1View in
            let settingView = SettingsType1View.shared
            settingView.settings = item
            return settingView
        }
        settings.forEach { (viewSetting) in
            settingsView.addArrangedSubview(viewSetting)
        }
        let settings2 =  SDSettings.type2.map { (item) -> SettingsType2View in
            let settingView = SettingsType2View.shared
            settingView.settings = item
            return settingView
        }
        settings2.forEach { (viewSetting) in
            settingsView.addArrangedSubview(viewSetting)
        }
        let settings3 =  SDSettings.type3.map { (item) -> SettingsType3View in
            let settingView = SettingsType3View.shared
            settingView.settings = item
            return settingView
        }
        settings3.forEach { (viewSetting) in
            settingsView.addArrangedSubview(viewSetting)
        }
        let phone = PhoneNumber.shared
        settingsView.addArrangedSubview(phone)
        let storage = SDStorageView.shared
        settingsView.addArrangedSubview(storage)
        let settings4 =  SDSettings.type4.map { (item) -> SettingsType4View in
            let settingView = SettingsType4View.shared
            settingView.settings = item
            return settingView
        }
        settings4.forEach { (viewSetting) in
            settingsView.addArrangedSubview(viewSetting)
        }
        let settings5 = SettingsType5View.shared
        settingsView.addArrangedSubview(settings5)
    }
    
    @IBAction private func didTapOnSettings() {
        viewNavigator.backFromSettings()
    }
    
}
