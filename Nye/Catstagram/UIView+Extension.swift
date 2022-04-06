//
//  UIView+Extension.swift
//  Catstagram
//
//  Created by csh on 2022/04/04.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat { // 모서리를 따온다
        get {
            return layer.cornerRadius // 수치 받기. 얼마나 둥글게?
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
