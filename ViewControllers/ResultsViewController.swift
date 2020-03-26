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
    
    var clientResultsList = [ClientResults]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientResultsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultsCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "resultsCell")
        let results: ClientResults
        results = clientResultsList[indexPath.row]
        resultsCell.textLabel?.text = "Input " + String(results.inputId)+" diet " + String(results.dietId) + " confidence " + String(results.confidence)
        return resultsCell
    }
    
    func resultsReadValues(){
        clientResultsList.removeAll()
        
        let clientInputQueryString =
            "select s1.InputId, s1.DietId, s1.Confidence " +
        "from ( " +
          "select " +
              "i1.InputId, " +
              "d1.DietId, " +
              "4 - abs (i1.DietaryRestrictions - d1.DietaryRestrictions) + " +
                "4 - abs (i1.Cost - d1.Cost) + " +
                "4 - abs (i1.Rules - d1.Rules) + " +
                "4 - abs (i1.MedicalCon - d1.MedicalCon) + " +
                "4 - abs (i1.Support - d1.Support) + " +
                "4 - abs (i1.TimeToPrepare - d1.TimeToPrepare) as Confidence " +
              "from ClientInput i1, DietData d1) s1 " +
              "inner join ( " +
          "select " +
              "i2.InputId, " +
              "max(4 - abs (i2.DietaryRestrictions - d2.DietaryRestrictions) + " +
                "4 - abs (i2.Cost - d2.Cost) + " +
                "4 - abs (i2.Rules - d2.Rules) + " +
                "4 - abs (i2.MedicalCon - d2.MedicalCon) + " +
                "4 - abs (i2.Support - d2.Support) + " +
                "4 - abs (i2.TimeToPrepare - d2.TimeToPrepare)) as Confidence " +
              "from ClientInput i2, DietData d2 " +
              "group by i2.InputId) s2 " +
              "on s1.InputId = s2.InputId " +
              "and s1.Confidence = s2.Confidence " +
          "order by s1.InputId desc"
        
        var stmt:OpaquePointer?
        let clientInputDB = SQLDatabase.shared.getDB()
        if sqlite3_prepare(clientInputDB, clientInputQueryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(clientInputDB)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let _inputId = sqlite3_column_int(stmt, 0)
            let _dietId = sqlite3_column_int(stmt, 1)
            let _confidence = sqlite3_column_int(stmt, 2)
            let tmp:ClientResults = ClientResults(inputId: _inputId, dietId: _dietId, confidence: _confidence)
            clientResultsList.append(tmp)
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
