//
//  SplashVC.swift
//  Pixaby
//
//  Created by Shivam Sharma on 19/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblBody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGradientWith(direction: .vertical, and: Constants.Colors.AppGradColorFirst.value,Constants.Colors.AppGradColorSecond.value)
        lblBody.setTextWithTypeAnimation(typedText: "A Boutique Tech Lab", characterDelay: 5.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            // Code to push/present new view controller
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
}


