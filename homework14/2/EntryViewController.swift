//
//  EntryViewController.swift
//  homework14
//
//  Created by Oleksandr Kiianskyi on 14.07.2021.
//

import UIKit
import RealmSwift
class EntryViewController: UIViewController {
    var update: (() -> Void)?
    @IBOutlet weak var newTaskTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    @IBAction func saveTask(_ sender: Any) {
        guard let text = newTaskTextField.text, !text.isEmpty else {
            return
        }
        let task = Task()
        task.text = text
        try! Realm().write{
            try! Realm().add(task)
        }
        update?()
        navigationController?.popViewController(animated: true)
    }
    
}
