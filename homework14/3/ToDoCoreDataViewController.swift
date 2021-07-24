//
//  ToDoCoreDataViewController.swift
//  homework14
//
//  Created by Oleksandr Kiianskyi on 15.07.2021.
//

import UIKit
import CoreData
class ToDoCoreDataViewController: UIViewController {
    var tasks: [TaskCD] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var toDoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTableView.tableFooterView = UIView()
        updateList()
    }
    func updateList(){
        self.tasks = try! context.fetch(TaskCD.fetchRequest())
        DispatchQueue.main.async {
            self.toDoTableView.reloadData()
        }
        
    }
    @IBAction func didTabAdd(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "EntryCD") as! EntryCDViewController
        vc.update = {
            DispatchQueue.main.async {
                self.updateList()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ToDoCoreDataViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCoreDataCell") as! CoreDataTableViewCell
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tasks.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let taskToRemove = tasks[indexPath.row]
            self.context.delete(taskToRemove)
            try! self.context.save()
            //self.updateList()
            self.tasks = try! context.fetch(TaskCD.fetchRequest())
            toDoTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
