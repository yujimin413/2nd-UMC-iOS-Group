//
//  UIView+Extension.swift
//  CatStaGram
//
//  Created by 유지민 on 2022/04/04.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {  //모따기. 모서리 둥근정도
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
