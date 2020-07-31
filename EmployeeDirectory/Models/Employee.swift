//
//  Employee.swift
//  EmployeeDirectory
//
//  Created by Kaival shah on 2020-07-25.
//  Copyright © 2020 Nency Kanani. All rights reserved.
//

import Foundation

enum employee_type : String , Decodable{
    case FULLTIME = "FULL_TIME"
    case PARTTIME = "PART_TIME"
    case CONTRACTOR = "CONTRACTOR"
}
struct EmployeeModel : Decodable,Identifiable{
    var id: String
    {
        return uuid ?? ""
    }
    
    
    var uuid : String?
    var full_name: String
    var phone_number : String?
    var email_address : String
    var biography : String?
    var photo_url_small : String?
    var photo_url_large : String?
    var team : String
    var employee_type : employee_type
}
struct EmployeeData : Decodable {
    
    var employees : [EmployeeModel]?
    
}

