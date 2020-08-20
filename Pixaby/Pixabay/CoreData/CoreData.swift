//
//  CoreData.swift
//  Pixabay
//
//  Created by Shivam Sharma on 20/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager:NSObject{
    
    static let shared = CoreDataManager()
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var arrayDataViewModel = [DataViewModel]()
    
    typealias completionBlock = ([DataViewModel]?) -> Void
    //MARK: FETCH DATA FROM COREDATA
    public  func fetchDataFromCoreData(searchedValue:String ,completionHandler:completionBlock) {

        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Suggestions")
       
        do {
            let result = try context.fetch(request)
            
            let arr = self.createJsonArray(array: result as! [NSManagedObject])
            
            self.arrayDataViewModel = arr.map({ return DataViewModel(searchValue: $0)})
            completionHandler(self.arrayDataViewModel)
        }
        catch {
            print("Error")
            completionHandler(nil)
            
        }
    }
    
    //MARK: SAVE DATA TO COREDATA
    public func saveDataToCoreData(value: String) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Suggestions", in: context)
        
        let newData = NSManagedObject(entity: entity!, insertInto: context)
        newData.managedObjectContext?.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        newData.setValue(value, forKey: "suggestSearch")

        do {
            try context.save()
        }catch{
            print("Error")
        }
    }
    func createJsonArray(array: [NSManagedObject]) -> [DataModel] {
        var arrayModel = [DataModel]()
        
        for data in array {
            let value = data.value(forKey: "suggestSearch") as! String
            print(value)
            arrayModel.append(DataModel(searchValue: value))
        }
        return arrayModel
    }
    
   public func isExist(value: String) -> Bool {

       let context = appDelegate.persistentContainer.viewContext
    
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Suggestions")
        fetchRequest.predicate = NSPredicate(format: "suggestSearch = %@",value)

        let res = try! context.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
}



