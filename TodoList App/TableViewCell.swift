//
//  TableViewCell.swift
//  TodoList App
//
//  Created by admin on 19/12/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
  
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var notelbl: UILabel!
    @IBOutlet weak var titlelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

