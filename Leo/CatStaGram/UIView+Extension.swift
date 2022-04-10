//
//  UIView+Extension.swift
//  CatStaGram
//
//  Created by 임영준 on 2022/04/03.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat { //모따기
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
