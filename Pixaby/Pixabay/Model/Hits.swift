//
//  Hits.swift
//  Pixabay
//
//  Created by Shivam Sharma on 20/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//

import Foundation
 
public class Hits {
	public var id : Int?
	public var pageURL : String?
	public var type : String?
	public var tags : String?
	public var previewURL : String?
	public var previewWidth : Int?
	public var previewHeight : Int?
	public var webformatURL : String?
	public var webformatWidth : Int?
	public var webformatHeight : Int?
	public var largeImageURL : String?
	public var imageWidth : Int?
	public var imageHeight : Int?
	public var imageSize : Int?
	public var views : Int?
	public var downloads : Int?
	public var favorites : Int?
	public var likes : Int?
	public var comments : Int?
	public var user_id : Int?
	public var user : String?
	public var userImageURL : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let hits_list = Hits.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Hits Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Hits]
    {
        var models:[Hits] = []
        for item in array
        {
            models.append(Hits(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let hits = Hits(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Hits Instance.
*/
	required public init?(dictionary: NSDictionary) {

		id = dictionary["id"] as? Int
		pageURL = dictionary["pageURL"] as? String
		type = dictionary["type"] as? String
		tags = dictionary["tags"] as? String
		previewURL = dictionary["previewURL"] as? String
		previewWidth = dictionary["previewWidth"] as? Int
		previewHeight = dictionary["previewHeight"] as? Int
		webformatURL = dictionary["webformatURL"] as? String
		webformatWidth = dictionary["webformatWidth"] as? Int
		webformatHeight = dictionary["webformatHeight"] as? Int
		largeImageURL = dictionary["largeImageURL"] as? String
		imageWidth = dictionary["imageWidth"] as? Int
		imageHeight = dictionary["imageHeight"] as? Int
		imageSize = dictionary["imageSize"] as? Int
		views = dictionary["views"] as? Int
		downloads = dictionary["downloads"] as? Int
		favorites = dictionary["favorites"] as? Int
		likes = dictionary["likes"] as? Int
		comments = dictionary["comments"] as? Int
		user_id = dictionary["user_id"] as? Int
		user = dictionary["user"] as? String
		userImageURL = dictionary["userImageURL"] as? String
	}
}
