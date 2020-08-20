//
//  AppColors.swift
//  Pixabay
//
//  Created by Shivam Sharma on 19/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//

import Foundation

import UIKit

enum Constants {
    enum Colors: String {
        case AppBlueColor = "AppBlueColor"
        case AppGradColorFirst = "AppGradColorFirst"
        case AppGradColorSecond = "AppGradColorSecond"
      case AppDarkGrayColor = "AppDarkGrayColor"
        case AppGrayColor  = "AppGrayColor"
        var value: UIColor {
            return UIColor(named: rawValue) ?? .black
        }
    }
}
