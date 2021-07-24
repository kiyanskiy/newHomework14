//
//  RealmTableViewCell.swift
//  homework14
//
//  Created by Oleksandr Kiianskyi on 13.07.2021.
//

import UIKit

class RealmTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    func fillCell(_ task: Task){
        itemLabel.text = task.text
        
    }
   
}
