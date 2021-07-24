//
//  CoreDataTableViewCell.swift
//  homework14
//
//  Created by Oleksandr Kiianskyi on 15.07.2021.
//

import UIKit
import CoreData

class CoreDataTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func fillCell(_ task: TaskCD){
        itemLabel.text = task.text
    }
    
}

