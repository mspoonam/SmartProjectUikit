//
//  TaskUtility.swift
//  SmartProjectUikit
//
//  Created by chandni chaudhari on 01/11/22.
//

import Foundation

public class TasksUtility {
    private static let key = "task"
    
    private static func archive(task: [[Task]]) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: task) as NSData
    }
    
    static func fetch() -> [[Task]]? {
        guard let unarchivedData = UserDefaults.standard.object(forKey: key) as? Data else {
            return nil
        }
        return NSKeyedUnarchiver.unarchiveObject(with: unarchivedData) as? [[Task]]
    }
    
    static func save(task: [[Task]]) {
        let archiveTasks = archive(task: task)
        
        UserDefaults.standard.set(archiveTasks, forKey: key)
        UserDefaults.standard.synchronize()
        
    }
}

