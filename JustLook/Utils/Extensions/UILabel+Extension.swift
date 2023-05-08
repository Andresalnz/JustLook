//
//  UILabel+Extension.swift
//  JustLook
//
//  Created by Andres Aleu on 8/5/23.
//

import Foundation
import UIKit

extension UILabel {
    func generalLabel(_ text: String?, _ textColor: UIColor?, _ font: UIFont?) {
        guard let text = text else { return }
        guard let textColor = textColor else { return }
        guard let font = font else { return }
        self.text = text
        self.textColor = textColor
        self.font = font
    }
}


