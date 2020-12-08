//
//  MessageViewController.swift
//  ScriptDoor
//
//  Created by PCQ187 on 07/12/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class MessageViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var messageTableView: UITableView!
    @IBOutlet private weak var messageTextView: UITextView!
    @IBOutlet private weak var attachmentButton: UIButton!
    @IBOutlet private weak var sendMessageButton: UIButton!
    @IBOutlet private weak var audioButton: UIButton!
    @IBOutlet private weak var textViewLeft: NSLayoutConstraint!
    
    // MARK: - Variable
    private let messagePlaceHolder = "Type a message here…"
    var arrayChat: [ScriptDoorMessage] = [ScriptDoorMessage]()
    var viewHeight: CGFloat = 0.0
    var textViewMaxHeight: CGFloat = 120
    lazy var viewNaviation: MessageViewNagiation = MessageViewNagiation(viewController: self)
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.enable = true
    }
    private func prepareView() {
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.enable = false
        messageTextView.textContainerInset = UIEdgeInsets(top: 12, left: 0, bottom: 5, right: 16)
        arrayChat.append(ScriptDoorMessage(message: "Hii", messageSource: .receiver, messageTime: ""))
        arrayChat.append(ScriptDoorMessage(message: "Hello..", messageSource: .receiver, messageTime: ""))
         addObervers()
        viewHeight = view.frame.size.height
    }
    
    // MARK: - Action Methods
    @IBAction private func didTapOnSend() {
        if messageTextView.text.trimmedLength > 0{
            arrayChat.append(ScriptDoorMessage(message: messageTextView.text.trimmed, messageSource: .sender, messageTime: ""))
            messageTableView.reloadData()
            clearMesage()
        }
    }
    
    @IBAction private func didTapOnBack() {
        viewNaviation.backToChat()
    }
    
    private func addObervers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(sender: Notification) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.size.height == viewHeight {
                view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - keyboardSize.height)
                view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(sender: Notification) {
        
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
               view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height + keyboardSize.height)
            
            view.layoutIfNeeded()
        }
    }
    
    private func clearMesage() {
        messageTextView.text = ""
        attachmentButton.isHidden = false
        audioButton.isHidden = false
        textViewLeft.constant = 40
        sendMessageButton.isHidden = true
        messageTextView.isScrollEnabled = false
        messageTextView.layoutSubviews()
    }
}

// MARK: - Extension TableView
extension MessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayChat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = arrayChat[indexPath.row]
        if message.messageSource == .receiver {
            let cell = tableView.getTableViewCell(cellID: ReceiverMessageCell.self )
            cell?.message = message
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.getTableViewCell(cellID: SenderMessageCell.self )
            cell?.message = message
            return cell ?? UITableViewCell()
        }
    }
}

extension MessageViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.trimmedLength > 0 {
            attachmentButton.isHidden = true
            audioButton.isHidden = true
            textViewLeft.constant = 0
            sendMessageButton.isHidden = false
        } else {
            attachmentButton.isHidden = false
            audioButton.isHidden = false
            sendMessageButton.isHidden = true
            textViewLeft.constant = 40
        }
        if textView.contentSize.height >= self.textViewMaxHeight {
            textView.isScrollEnabled = true
        }
        else {
            textView.isScrollEnabled = false
        }
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.text.trimmed == messagePlaceHolder {
            textView.text = ""
             sendMessageButton.isHidden = true
            textView.textColor = UIColor.appColors.appBlack
        }
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if textView.text.trimmed == messagePlaceHolder {
            textView.text = ""
            textView.textColor = UIColor.appColors.lightGray
        }
        return true
    }
    
}
