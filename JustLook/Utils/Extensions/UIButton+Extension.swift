//
//  UIButton+Extension.swift
//  JustLook
//
//  Created by Andres Aleu on 8/5/23.
//

import Foundation
import UIKit

extension UIButton {
    func generalButton(_ title: String?, tintColor: UIColor?) {
        guard let title = title else { return }
        guard let tintColor = tintColor else { return }
        self.setTitle(title, for: .normal)
        self.tintColor = tintColor
    }
    
    func generalButtonWithImage(_ title: String?, tintColor: UIColor?, image: UIImage?) {
        guard let title = title else { return }
        guard let tintColor = tintColor else { return }
        guard let image = image else { return }
        self.setTitle(title, for: .normal)
        self.tintColor = tintColor
        self.setImage(image, for: .normal)
    }
}
