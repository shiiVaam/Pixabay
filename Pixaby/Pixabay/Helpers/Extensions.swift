//
//  File.swift
//  Pixabay
//
//  Created by Shivam Sharma on 20/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    //MARK: ALERT VIEW
   public func showAlert(title:String, message:String) {
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertMessage.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertMessage, animated: true, completion: nil)
    }
}

