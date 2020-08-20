/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

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

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.pageURL, forKey: "pageURL")
		dictionary.setValue(self.type, forKey: "type")
		dictionary.setValue(self.tags, forKey: "tags")
		dictionary.setValue(self.previewURL, forKey: "previewURL")
		dictionary.setValue(self.previewWidth, forKey: "previewWidth")
		dictionary.setValue(self.previewHeight, forKey: "previewHeight")
		dictionary.setValue(self.webformatURL, forKey: "webformatURL")
		dictionary.setValue(self.webformatWidth, forKey: "webformatWidth")
		dictionary.setValue(self.webformatHeight, forKey: "webformatHeight")
		dictionary.setValue(self.largeImageURL, forKey: "largeImageURL")
		dictionary.setValue(self.imageWidth, forKey: "imageWidth")
		dictionary.setValue(self.imageHeight, forKey: "imageHeight")
		dictionary.setValue(self.imageSize, forKey: "imageSize")
		dictionary.setValue(self.views, forKey: "views")
		dictionary.setValue(self.downloads, forKey: "downloads")
		dictionary.setValue(self.favorites, forKey: "favorites")
		dictionary.setValue(self.likes, forKey: "likes")
		dictionary.setValue(self.comments, forKey: "comments")
		dictionary.setValue(self.user_id, forKey: "user_id")
		dictionary.setValue(self.user, forKey: "user")
		dictionary.setValue(self.userImageURL, forKey: "userImageURL")

		return dictionary
	}

}