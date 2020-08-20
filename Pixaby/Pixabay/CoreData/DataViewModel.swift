//
//  DataViewModel.swift
//  Pixabay
//
//  Created by Shivam Sharma on 20/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//

import UIKit

class DataViewModel {
    
    var searchValue: String!
    
    // MARK: DEPENDENCY INJECTION ON THE MODEL
    init(searchValue:DataModel) {
        self.searchValue = searchValue.searchValue
    }
    
    
}
