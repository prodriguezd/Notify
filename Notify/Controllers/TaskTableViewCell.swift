//
//  TaskTableViewCell.swift
//  Notify
//
//  Created by Alumne on 09/11/2020.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskState: UIImageView!
    
    @IBOutlet weak var taskName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
