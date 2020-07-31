//
//  EmployeeViewController.swift
//  EmployeeDirectory
//
//  Created by Kaival shah on 2020-07-25.
//  Copyright © 2020 Nency Kanani. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    //MARK: Outlates and variables
    @IBOutlet weak var employeeImage: UIImageView!
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeBiography: UILabel!
    @IBOutlet weak var employeeTeam: UILabel!
    @IBOutlet weak var employeeType: UILabel!
    @IBOutlet weak var employeePhone: UILabel!
    @IBOutlet weak var employeeEmail: UILabel!
    
    //MARK: Variables
    var employees:EmployeeModel?
    
    //MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()        
        employeeImage.sd_setImage(with: URL(string: employees?.photo_url_large ?? "person.circle.fill"))
        employeeName.text = employees?.full_name
        employeeBiography.text = employees?.biography ?? "Biography not provided"
        employeeTeam.text = employees?.team
        employeeType.text = employees?.employee_type.rawValue 
        employeePhone.text = employees?.phone_number ?? "Phone Number not provided"
        employeeEmail.text = employees?.email_address
    }
}
