//
//  MenuBarTableViewCell.swift
//  BMI_3
//
//  Created by Nguyễn Văn Hiếu on 20/9/24.
//

import UIKit

class MenuBarTableViewCell: UITableViewCell {
    @IBOutlet weak var createDate: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
