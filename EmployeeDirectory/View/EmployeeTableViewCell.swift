//
//  EmployeeTableViewCell.swift
//  EmployeeDirectory
//
//  Created by Kaival shah on 2020-07-25.
//  Copyright © 2020 Nency Kanani. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    //MARK: Outlates
    @IBOutlet weak var employeeImage: UIImageView!
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeTeam: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        employeeImage?.clipsToBounds = true
        employeeImage?.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

