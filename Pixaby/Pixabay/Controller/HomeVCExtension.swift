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
        if searchActive == true {
            return (searchedSuggestions.count != 0) ? (searchedSuggestions.count) : (0)
        } else {
            return (arraySearchSuggestions.count != 0) ? (arraySearchSuggestions.count) : (0)
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if searchActive == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            cell.textLabel?.text = searchedSuggestions[indexPath.row].searchValue
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            cell.textLabel?.text = arraySearchSuggestions[indexPath.row].searchValue
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if searchActive == true {
            callApi(with: searchedSuggestions[indexPath.row].searchValue, pageNumber: 1)
            txtFieldSearch.text = searchedSuggestions[indexPath.row].searchValue
        } else {
            callApi(with: arraySearchSuggestions[indexPath.row].searchValue, pageNumber: 1)
            txtFieldSearch.text = arraySearchSuggestions[indexPath.row].searchValue
        }
        tblViewSearch.isHidden = true
    }
}
