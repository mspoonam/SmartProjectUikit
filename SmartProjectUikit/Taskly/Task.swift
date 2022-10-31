//
//  Task.swift
//  SmartProjectUikit
//
//  Created by chandni chaudhari on 31/10/22.
//

import Foundation

class Task {
    var name: String
    var isDone: Bool
    
    init(name:String, isDone: Bool = false) {
        self.name = name
        self.isDone = isDone
        
    }
}
