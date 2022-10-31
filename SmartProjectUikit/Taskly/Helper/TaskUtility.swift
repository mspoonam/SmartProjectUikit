//
//  TaskUtility.swift
//  SmartProjectUikit
//
//  Created by chandni chaudhari on 01/11/22.
//

import Foundation

class taskUtility {
    private static let key = "task"
    
    private static func archive( task: [[task]]) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: tasks) as NSData
        
    }
    
    static func fetch() -> [[Task]])? {
        guard let unarchivedData = UserDefaults.standard.object(forKey: key)as? Data else {
            return NSkeyedUnArchiver.unarchiveObject(with: unarchivedData) as? [[Task]]
        }
        
        static func save( task: [[Task]]) {
            let archiveTasks = archive(tasks)
            
            UserDefaults.standard.set(archivedTasks, forkey: key)
            UserDefaults.standard.synchronize()
            
        }
    }

}
