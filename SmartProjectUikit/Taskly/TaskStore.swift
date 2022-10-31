//
//  TaskStore.swift
//  SmartProjectUikit
//
//  Created by chandni chaudhari on 31/10/22.
//

import Foundation

class TaskStore {
    
    var tasks = [[Task](), [Task]()]
    
    // add tasks
    func add(task: Task, at index: Int, isDone: Bool = false) {
        
        let section = isDone ? 1 : 0
        tasks[section].insert(task, at: index)
        
    }
    
    
    
    //remove tasks
    @discardableResult func removeTask(at index: Int, isDone: Bool = false) -> Task {
        
        let section = isDone ? 1 : 0
        return tasks[section].remove(at: index)
        
    }
}
