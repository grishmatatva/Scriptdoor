//
//  SDTextField.swift
//  ScriptDoor
//
//  Created by Yuvi's - MAC103 on 08/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

@IBDesignable
class SDTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return super.leftViewRect(forBounds: bounds)
    }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        super.rightViewRect(forBounds: bounds)
    }
    
    func setLeftImage(image : UIImage) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.frame.size.height))
        let imageView = UIImageView(frame: CGRect(x: 15, y: 0, width: 16, height: self.frame.size.height))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        self.leftView = view
        self.leftViewMode = .always
    }
    
    func setRightImage(image : UIImage) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.frame.size.height))
        let imageView = UIImageView(frame: CGRect(x: 15, y: 0, width: 16, height: self.frame.size.height))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        self.rightView = view
        self.rightViewMode = .always
    }
    
    func setRightImage(image : UIImage, selectedImage : UIImage, isSelected: Bool = false) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height))
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height))
        button.setImage(image, for: .normal)
        button.setImage(selectedImage, for: .selected)
        button.addTarget(self, action: #selector(setRightButton(_:)), for: .touchUpInside)
        button.isSelected = isSelected
        view.addSubview(button)
        self.rightView = view
        self.rightViewMode = .always
    }
    
    @objc private func setRightButton(_ sender : UIButton) {
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = !self.isSecureTextEntry
    }
    var rigthViewClick:(() -> Void)?
    // MARK: - Properties
    @IBInspectable var borderBottomColor: UIColor = UIColor.clear {
        didSet {
            DispatchQueue.main.async {
                self.addBottomBorder()
            }
        }
    }
    @IBInspectable var placeholderColor: UIColor = UIColor.black {
        didSet {
            if let plc = self.placeholder {
                self.attributedPlaceholder = NSAttributedString(string: plc,
                                                                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
            }
        }
    }
    @IBInspectable var borderBottomWidth: CGFloat = 0.0 {
        didSet {
            DispatchQueue.main.async {
                self.addBottomBorder()
            }
        }
    }
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var rightPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var leftPaddingAfterImage: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var imageMaxHeight: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    // MARK: - Methods
    private func addBottomBorder() {
        self.layoutIfNeeded()
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.height - self.borderBottomWidth, width: self.frame.width, height: self.borderBottomWidth)
        bottomLine.backgroundColor = self.borderBottomColor.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
    private func calculateContainerViewSize(for image: UIImage) -> CGSize {
        let imageRatio = image.size.height / image.size.width
        let adjustedImageMaxHeight = imageMaxHeight > self.frame.height ? self.frame.height : imageMaxHeight
        
        var imageSize = CGSize()
        if image.size.height > adjustedImageMaxHeight {
            imageSize.height = adjustedImageMaxHeight
            imageSize.width = imageSize.height / imageRatio
        }
        
        let paddingWidth = leftPadding + rightPadding
        
        let containerSize = CGSize(width: imageSize.width + paddingWidth, height: imageSize.height)
        return containerSize
    }
    
    private func setImageViewConstraints(_ imageView: UIImageView, in containerView: UIView) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -rightPadding).isActive = true
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: leftPadding).isActive = true
    }
    
    private func setImageViewProperties(_ imageView: UIImageView, image: UIImage) {
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        imageView.tintColor = color
    }
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let containerSize = calculateContainerViewSize(for: image)
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: containerSize.width + leftPaddingAfterImage, height: containerSize.height))
            
            let imageView = UIImageView(frame: .zero)
            containerView.addSubview(imageView)
            setImageViewConstraints(imageView, in: containerView)
            
            setImageViewProperties(imageView, image: image)
            
            leftView = containerView
        } else {
            leftViewMode = UITextField.ViewMode.always
            let containerSize = CGSize(width: leftPadding , height: self.frame.height)
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: containerSize.width, height: containerSize.height))
            leftView = containerView
        }
        if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let containerSize = calculateContainerViewSize(for: image)
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: containerSize.width, height: containerSize.height))
            let imageView = UIImageView(frame: .zero)
            containerView.addSubview(imageView)
            setImageViewConstraints(imageView, in: containerView)
            setImageViewProperties(imageView, image: image)
            
            let tapRigth = UITapGestureRecognizer(target: self, action: #selector(rightViewTap))
            tapRigth.numberOfTouchesRequired = 1;
            containerView.addGestureRecognizer(tapRigth);
            rightView = containerView
        } else {
            rightViewMode = UITextField.ViewMode.always
            leftViewMode = UITextField.ViewMode.always
            let containerSize = CGSize(width: rightPadding , height: self.frame.height)
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: containerSize.width, height: containerSize.height))
            rightView = containerView
        }
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "",
                                                   attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
    @objc func rightViewTap() {
        self.rigthViewClick?()
    }
    
    func leftViewMode(show: Bool){
        if show {
            leftViewMode = .always
        } else {
            leftViewMode = .never
        }
    }
    func rightViewMode(show: Bool){
        if show {
            rightViewMode = .always
        } else {
            rightViewMode = .never
        }
    }
    
}
