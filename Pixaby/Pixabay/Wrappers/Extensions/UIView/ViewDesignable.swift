//
//  ViewDesignable.swift
//  Event Detail Demo
//
//  Created by Shivam Sharma on 12/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//
//

import UIKit

extension UIView {
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

//MARK: - Shadow related
extension UIView {
    private var shadow: UIBezierPath {
        let rect = CGRect(x: 0, y: 0, width: frame.width - shadowOffset.width*2.5,
                          height: frame.height - shadowOffset.height*2.5)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        return path
    }
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable var shadowColor: UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
    }
    @IBInspectable var showShadow: Bool {
        set {
            layer.masksToBounds = !newValue
            layer.shadowPath = !newValue ? shadow.cgPath : nil
        }
        get {
            return !layer.masksToBounds
        }
    }
}

