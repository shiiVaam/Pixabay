//
//  ViewGradient.swift
//  Pixabay
//
//  Created by Shivam Sharma on 19/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Gradient
extension UIView {
    enum Direction {
        case horizontal, vertical
        
        var startPoint: CGPoint {
            switch self {
            case .horizontal: return CGPoint(x: 0.0, y: 0.5)
            case .vertical: return CGPoint(x: 0.5, y: 0.0)
            }
        }
        
        var endPoint: CGPoint {
            switch self {
            case .horizontal: return CGPoint(x: 1.0, y: 0.5)
            case .vertical: return CGPoint(x: 0.5, y: 1.0)
            }
        }
    }
    
    /**
     Adds gradient of colors passed to the view as a sublayer
     - parameter direction: Desired direction(horizontal/vertical)
     - parameter colors: Colors produce the target gradient
     */
    func addGradientWith(direction: Direction, and colors: UIColor...) {
        let gradient = CAGradientLayer()
        gradient.colors = colors.map{ $0.cgColor }
        gradient.frame = layer.frame
        gradient.locations = [0.0,1.0]
        gradient.startPoint = direction.startPoint
        gradient.endPoint = direction.endPoint
        layer.insertSublayer(gradient, at: 0)
    }
}
