//
//  EmployeeTableViewController.swift
//  EmployeeDirectory
//
//  Created by Kaival shah on 2020-07-25.
//  Copyright © 2020 Nency Kanani. All rights reserved.
//

import UIKit

class EmployeeTableViewController: UITableViewController {
    
    //MARK: Variables
    var jsonemployee = [EmployeeModel]()
    //MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getEmployeeList { (employeedata, error) in
            print("completed")
        }
        self.tableView.reloadData()
        self.navigationItem.title = "Employees"
        tableView.separatorColor = #colorLiteral(red: 0.794745522, green: 0.9902682412, blue: 1, alpha: 1)
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jsonemployee.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as! EmployeeTableViewCell
        let employee = jsonemployee[indexPath.row]
        cell.employeeImage.sd_setImage(with: URL(string: employee.photo_url_small ?? "person.circle.fill"))
        cell.employeeName.text = employee.full_name 
       cell.employeeTeam.text = employee.team 
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          performSegue(withIdentifier: "EmployeeDetails", sender: self)
      }
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if let destination = segue.destination as? EmployeeViewController{
              destination.employees = jsonemployee[(tableView.indexPathForSelectedRow?.row)!]
          }
      }
    
    // MARK: Function for Decoding JSON Data
    func getEmployeeList(completion: @escaping (EmployeeData?, Error?) -> Void){
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json")
            //if let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json")
            else {return}
        
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {return}
                do {
                    let employee = try JSONDecoder().decode(EmployeeData.self, from: data)
                    DispatchQueue.main.async {
                        for employeedata in employee.employees!{
                            self.jsonemployee.append(employeedata)
                            self.tableView.reloadData()
                        }
                    }
                } // Catches Error Responses
                catch {
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        let errorAlert = UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: .alert)
                        errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(errorAlert, animated: true)
                    }
                    
                }
            }.resume()
    }
}
