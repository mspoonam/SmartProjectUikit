//
//  TasksController.swift
//  SmartProjectUikit
//
//  Created by chandni chaudhari on 31/10/22.
///Users/chandniwork/Work/30october/SmartProjectUikit/Taskly

import UIKit

class TasksController: UITableViewController {
    
    var taskStore = TaskStore() {
        
        didSet {
            taskStore.tasks = TasksUtility.fetch() ?? [[Task](), [Task]()]
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        let todoTasks = [Task(name: "Meditate"), Task(name: "Buy Bananas"), Task(name: "Run a 5K")]
        let doneTasks = [Task(name: "Watch Netflix")]
        
        taskStore.tasks = [todoTasks, doneTasks]
    }
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add" , style: .default) { _ in
            
            guard let name = alertController.textFields?.first?.text else { return }
            
            let newTask = Task(name: name)
            
            self.taskStore.add(task: newTask, at: 0)
            
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            
            TasksUtility.save(task: self.taskStore.tasks)
        }
        
        addAction.isEnabled = false
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addTextField {
            textFiled in
            
            textFiled.placeholder = "Enter task name..."
            textFiled.addTarget(self, action: #selector(self.handleTextChanged),for: .editingChanged)
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    @objc private func handleTextChanged( sender: UITextField) {
        
        guard let alertController = presentedViewController as? UIAlertController,
              let addAction = alertController.actions.first,
              let text = sender.text
        else { return }
        
        addAction.isEnabled = text.trimmingCharacters(in: .whitespaces).isEmpty
        
    }
    
}
// MARK: - DataSource

extension TasksController {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "To-do" : " Done"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
             return taskStore.tasks.count
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.tasks[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        //    cell.textLable?.text = taskStore.tasks[indexPath.section][indexPath.row].name
        return cell
    }
    
}

extension TasksController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 54
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, sourceView, completionHandler) in
            
            let isDone = self.taskStore.tasks[indexPath.section][indexPath.row].isDone
            
            self.taskStore.removeTask(at: indexPath.row, isDone: isDone)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            TasksUtility.save(task: self.taskStore.tasks)
            
            completionHandler(true)
            
        }
         // TODO: Poonam come back
//        deleteAction.image =
//        deleteAction.backgroundColor =
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let doneAction = UIContextualAction(style: .normal, title: nil) { (action, sourceView, completionHandler) in
            
            self.taskStore.tasks[0][indexPath.row].isDone = true
            
            let doneTask = self.taskStore.removeTask(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            self.taskStore.add(task: doneTask, at: 0, isDone: true)
            
            tableView.insertRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
            
            TasksUtility.save(task: self.taskStore.tasks)
            
            completionHandler(true)
            
        }
        // TODO: Poonam come back
//        doneAction.image = doneAction
//        doneAction.backgroundColor =
        
        
        return indexPath.section == 0 ? UISwipeActionsConfiguration(actions: [doneAction]) : nil
    }
}
