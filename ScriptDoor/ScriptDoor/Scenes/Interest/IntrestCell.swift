//
//  IntrestCell.swift
//  ScriptDoor
//
//  Created by pcq196 on 13/10/20.
//  Copyright © 2020 Yuvi's - MAC103. All rights reserved.
//

import UIKit

enum BubbleDirection : CaseIterable {
    case up
    case down
    case right
    case left
    case center
    case topleft
    case bottomleft
    case topRight
    case bottomRight
}

struct IntrestModel: Codable {
    var name: String?
    var selected: Bool?
    var direction: BubbleDirection?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        
    }
}

// MARK: - Class
class IntrestCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var labelBubbleText: UILabel!
    @IBOutlet weak var viewBubble: UIView!
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var centerX: NSLayoutConstraint!
    @IBOutlet weak var centerY: NSLayoutConstraint!
    
    // MARK: - Variables
    var direction: BubbleDirection = .center
    let bubblecolor: UIColor =  UIColor.random()
    var didSelecte:((Bool) -> Void)?
    
    var text: String?{
        didSet {
            labelBubbleText.text = text ?? ""
            prepareView()
        }
    }
    
    // MARK: - Helper Methods
    func prepareView() {
        viewBubble.backgroundColor = bubblecolor
        layoutIfNeeded()
        viewBubble.layoutIfNeeded()
        viewBubble.layoutSubviews()
        height.constant = viewBubble.frame.width
        viewBubble.cornerRadius = (viewBubble.frame.width / 2)
        viewBubble.clipsToBounds = true
        layoutIfNeeded()
        layoutSubviews()
        
        switch direction {
        case .up:
            let top = ((125 - viewBubble.frame.height) / 5)
            centerY.constant = -top
            break;
        case .down:
            let top = ((125 - viewBubble.frame.height) / 5)
            centerY.constant = top
            break;
        case .left:
            let top = ((125 - viewBubble.frame.width) / 2)
            centerX.constant = top
            break;
        case .right:
            let top = ((125 - viewBubble.frame.width) / 2)
            centerX.constant = (-top)
            break;
        case .topleft:
            let top = ((125 - viewBubble.frame.height) / 4)
            centerY.constant = -top
            let left = ((125 - viewBubble.frame.width) / 2)
            centerX.constant = left
        case .topRight:
            let top = ((125 - viewBubble.frame.height) / 4)
            centerY.constant = -top
            let right = ((125 - viewBubble.frame.width) / 2)
            centerX.constant = (-right)
        case .bottomleft:
            let top = ((125 - viewBubble.frame.height) / 4)
            centerY.constant = top
            let left = ((125 - viewBubble.frame.width) / 2)
            centerX.constant = left
        case .bottomRight:
            let bottom = ((125 - viewBubble.frame.height) / 4)
            centerY.constant = bottom
            let top = ((125 - viewBubble.frame.width) / 2)
            centerX.constant = (-top)
        case .center:
            break
        }
    }
    
    // MARK: - Action Methods
    @IBAction private func didTapOnSelectBubble(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        didSelecte?(sender.isSelected)
    }
}

// MARK: - Extensions
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}
