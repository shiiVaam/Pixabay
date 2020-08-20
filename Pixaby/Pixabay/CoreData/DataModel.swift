//
//  DataModel.swift
//  Pixabay
//
//  Created by Shivam Sharma on 20/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//

import UIKit

class DataModel: NSObject {

    var searchValue: String!
    
    init(searchValue: String) {
        self.searchValue = searchValue
    }
}
