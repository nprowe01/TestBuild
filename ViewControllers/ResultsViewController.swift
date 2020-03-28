//
//  ResultsViewController.swift
//  MadelineNEADietApp
//
//  Created by Madeline on 27/11/2019.
//  Copyright © 2019 Madeline. All rights reserved.
//

import UIKit
import SQLite3

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var resultsTable: UITableView!
    
    var clientInputList = [ClientInput]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientInputList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultsCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "resultsCell")
        let results: ClientInput
        results = clientInputList[indexPath.row]
        resultsCell.textLabel?.text = String(results.dietaryRestrictions)
        return resultsCell
    }
    
    func resultsReadValues(){
        clientInputList.removeAll()
        
        let clientInputQueryString = "SELECT dietaryRestrictions, cost, rules, medicalCon, support, time FROM clientInput"
        
        var stmt:OpaquePointer?
        let clientInputDB = SQLDatabase.shared.getDB()
        if sqlite3_prepare(clientInputDB, clientInputQueryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(clientInputDB)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let _dietaryRestrictions = sqlite3_column_int(stmt, 0)
            let _cost = sqlite3_column_int(stmt, 1)
            let _rules = sqlite3_column_int(stmt, 2)
            let _medicalCon = sqlite3_column_int(stmt, 3)
            let _support = sqlite3_column_int(stmt, 4)
            let _time = sqlite3_column_int(stmt, 5)
            let tmp:ClientInput = ClientInput(dietaryRestrictions: _dietaryRestrictions, cost: _cost, rules: _rules, medicalCon: _medicalCon, support: _support, time: _time)
            clientInputList.append(tmp)
        }
        
        self.resultsTable.reloadData()
    }
    
    override func viewDidLoad() {
        resultsReadValues()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
