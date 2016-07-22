//
//  Post.swift
//  my-hood
//
//  Created by Ziga Strgar on 08/07/16.
//  Copyright © 2016 Ziga Strgar. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    private var _imagePath: String!
    private var _title: String!
    private var _content: String!
    
    var title: String {
        return _title
    }
    
    var imagePath: String {
        return _imagePath
    }
    
    var content: String {
        return _content
    }
    
    init(image: String, title: String, description: String){
        self._imagePath = image
        self._title = title
        self._content = description
    }
    
    override init() {
        
    }
   
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._content = aDecoder.decodeObjectForKey("content") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(_title, forKey: "title")
        aCoder.encodeObject(_content, forKey: "content")
        aCoder.encodeObject(_imagePath, forKey: "imagePath")
    }
    
}