//
//  NameViewController.swift
//  homework14Git
//
//  Created by Oleksandr Kiianskyi on 16.07.2021.
//
import UIKit

class NameViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = Human.shared.name
        surnameTextField.text = Human.shared.surname
    }
    @IBAction func didChangeName(_ sender: Any) {
        Human.shared.name = nameTextField.text
    }
    
    @IBAction func didChangeSurname(_ sender: Any) {
        Human.shared.surname = surnameTextField.text
    }
}

