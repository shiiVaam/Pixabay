//
//  HomeVCExtension.swift
//  Pixabay
//
//  Created by Shivam Sharma on 20/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//

import Foundation
import UIKit

extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySearchSuggestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = arraySearchSuggestions[indexPath.row].searchValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        callApi(with: arraySearchSuggestions[indexPath.row].searchValue, pageNumber: 1)
        tblViewSearch.isHidden = true
        txtFieldSearch.text = arraySearchSuggestions[indexPath.row].searchValue
    }
}
