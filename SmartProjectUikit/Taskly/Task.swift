//
//  Task.swift
//  SmartProjectUikit
//
//  Created by chandni chaudhari on 31/10/22.
//

import Foundation

class Task: NSObject, NSCoding {
    
    var name: String?
    var isDone: Bool?
    
    let namekey = "name"
    let isDonekey = "isDone"
    
    
    init(name:String, isDone: Bool = false) {
        self.name = name
        self.isDone = isDone
        
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: "name")
        aCoder.encode(isDone, forKey: "isDone")
        
    }
   
    required init?(coder aDecoder: NSCoder) {
        
        guard let name = aDecoder.decodeObject(forKey: namekey)as? String,
              let isDone = aDecoder.decodeObject(forKey: isDonekey)as? Bool
        else { return }
        
        self.name = name
        self.isDone = isDone
        
        
        
    }
    
}

