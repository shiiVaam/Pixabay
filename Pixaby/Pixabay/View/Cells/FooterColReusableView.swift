//
//  FooterColReusableView.swift
//  Pixabay
//
//  Created by Shivam Sharma on 20/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class FooterColReusableView: UICollectionReusableView {

    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        activityIndicator.startAnimating()
    }
    
}
