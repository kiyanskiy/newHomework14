//
//  EntryCDViewController.swift
//  homework14
//
//  Created by Oleksandr Kiianskyi on 15.07.2021.
//

import UIKit

class EntryCDViewController: UIViewController {
    @IBOutlet weak var newTaskTextField: UITextField!
    var update: (() -> Void)?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveNewTask(_ sender: Any) {
        guard let text = newTaskTextField.text, !text.isEmpty else {
            return
        }
        let newTask = TaskCD(context: context)
        newTask.text = text
        try! self.context.save()
        update?()
        navigationController?.popViewController(animated: true)
    }
    
}
