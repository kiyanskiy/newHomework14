//
//  ToDoRealmViewController.swift
//  homework14
//
//  Created by Oleksandr Kiianskyi on 13.07.2021.
//

import UIKit
import RealmSwift

class Task: Object{
   @objc dynamic var text = ""

}

class ToDoRealmViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTableView.tableFooterView = UIView()
        
    }
    func updateList(){
        toDoTableView.reloadData()
    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "Entry") as! EntryViewController
        vc.update = {
            DispatchQueue.main.async {
                self.updateList()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension ToDoRealmViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoRealmCell") as! RealmTableViewCell
        let task = try! Realm().objects(Task.self)[indexPath.row]
        cell.fillCell(task)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return try! Realm().objects(Task.self).count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let task = try! Realm().objects(Task.self)[indexPath.row]
            try! Realm().write{
                try! Realm().delete(task)
            }
            
            toDoTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
