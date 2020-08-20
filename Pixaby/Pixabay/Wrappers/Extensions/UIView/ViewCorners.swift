//
//  ViewCorners.swift
//  Event Detail Demo
//
//  Created by Shivam Sharma on 12/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//


import UIKit

extension UIView {
    enum Corners {
        case topLeft, topRight, bottomLeft, bottomRight, all
        
        var value: CACornerMask? {
            switch self {
            case .topLeft: return .layerMinXMinYCorner
            case .topRight: return .layerMaxXMinYCorner
            case .bottomLeft: return .layerMinXMaxYCorner
            case .bottomRight: return .layerMaxXMaxYCorner
            case .all: return nil
            }
        }
        
        var valueBelow11: UIRectCorner? {
            switch self {
            case .topLeft: return UIRectCorner.topLeft
            case .topRight: return UIRectCorner.topRight
            case .bottomLeft: return UIRectCorner.bottomLeft
            case .bottomRight: return UIRectCorner.bottomRight
            case .all: return nil
            }
        }
    }
    
    /**
     Set corner radius on selected corners of the view specially for iOS 11
     - parameter corners: Array of corners required to be rounded
     */
    @available(iOS 11.0, *)
    private func setCornersForiOS11(_ corners: [Corners]) {
        let cornerSet = Set(corners)
        let cornersToBeMasked = Array(cornerSet).compactMap{ $0.value }
        var cornerMask = CACornerMask()
        cornersToBeMasked.forEach {
            cornerMask.insert($0)
        }
        layer.maskedCorners = cornerMask
    }
    
    /**
     Set corner radius on selected corners of the view specially for iOS versions below 11
     - parameter corners: Array of corners required to be rounded
     - parameter radius: Radius required to be set
     */
    private func setCornersForBelowiOS11(_ corners: [Corners], _ radius: CGFloat) {
        let cornerSet = Set(corners)
        let cornersToBeMasked = Array(cornerSet).compactMap{ $0.valueBelow11 }
        var final = UIRectCorner()
        cornersToBeMasked.forEach {
            final.insert($0)
        }
        
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: final,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    /**
     Set corner radius on selected corners for a view
     - parameter radius: Radius required to be set
     - parameter corners: Corners to be rounded(variadic parameter)
     */
    func round(radius: CGFloat, corners: Corners...) {
        layer.cornerRadius = radius
        clipsToBounds = true
        if !corners.contains(.all) {
            if #available(iOS 11.0, *) {
                setCornersForiOS11(corners)
            } else {
                setCornersForBelowiOS11(corners, radius)
            }
        }
    }
}
