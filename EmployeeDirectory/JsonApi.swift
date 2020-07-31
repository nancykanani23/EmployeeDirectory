//
//  JsonApi.swift
//  EmployeeDirectory
//
//  Created by Kaival shah on 2020-07-30.
//  Copyright © 2020 Nency Kanani. All rights reserved.
//

import Foundation
class JsonApi{
    var session: URLSession!
    func getEmployeeList(completion: @escaping (EmployeeData?, Error?) -> Void) {
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json")
          else { fatalError() }
        session.dataTask(with: url) { (data, response, error) in
          guard let data = data else { return }
          let employee = try! JSONDecoder().decode(EmployeeData.self, from: data)
          completion(employee, nil)
        }.resume()
        
    }
}
