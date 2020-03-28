//
//  ResultsStackButtonViewController.swift
//  MadelineNEASQL
//
//  Created by Madeline on 26/03/2020.
//  Copyright © 2020 Madeline. All rights reserved.
//

import UIKit
import SQLite3

class ResultsStackButtonViewController: UIViewController {
    
    @IBOutlet weak var Button1: UIButton!
    
    
    @IBOutlet weak var Button2: UIButton!
    
    
    @IBOutlet weak var Button3: UIButton!
    
    var dietId1:Int32?
    var dietId2:Int32?
    var dietId3:Int32?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let clientInputQueryString =   "SELECT s1.InputId, min(s1.DietId), min(s1.Confidence) " +
            "FROM ( " +
            "SELECT " +
            "i1.InputId, " +
            "d1.DietId, " +
            "4 - abs (i1.DietaryRestrictions - d1.DietaryRestrictions) + " +
            "4 - abs (i1.Cost - d1.Cost) + " +
            "4 - abs (i1.Rules - d1.Rules) + " +
            "4 - abs (i1.MedicalCon - d1.MedicalCon) + " +
            "4 - abs (i1.Support - d1.Support) + " +
            "4 - abs (i1.Time - d1.Time) as Confidence " +
            "FROM ClientInput i1, DietData d1) s1 " +
            "inner join ( " +
            "SELECT " +
            "i2.InputId, " +
            "max(4 - abs (i2.DietaryRestrictions - d2.DietaryRestrictions) + " +
            "4 - abs (i2.Cost - d2.Cost) + " +
            "4 - abs (i2.Rules - d2.Rules) + " +
            "4 - abs (i2.MedicalCon - d2.MedicalCon) + " +
            "4 - abs (i2.Support - d2.Support) + " +
            "4 - abs (i2.Time - d2.Time)) as Confidence " +
            "FROM ClientInput i2, DietData d2 " +
            "group by i2.InputId) s2 " +
            "on s1.InputId = s2.InputId " +
            "and s1.Confidence = s2.Confidence " +
        "group by s1.InputId " +
        "ORDER BY s1.InputId DESC"
        
        var stmt:OpaquePointer?
        let clientInputDB = SQLDatabase.shared.getDB()
        if sqlite3_prepare(clientInputDB, clientInputQueryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(clientInputDB)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        var count=1
        while(sqlite3_step(stmt) == SQLITE_ROW){
//            let inputId = sqlite3_column_int(stmt, 0)
            let dietId = sqlite3_column_int(stmt, 1)
            let confidence = Double(sqlite3_column_int(stmt, 2)) * 100 / 24.0
            
            switch (count) {
            case 1:
                Button1.setTitle ("Your latest result mean we recommend diet " + String(dietId) + " with a confidence of " + String(confidence), for: UIControl.State.normal)
                dietId1 = dietId
                break
            case 2:
                Button2.setTitle ("Your previous result mean we recommend diet " + String(dietId) + " with a confidence of " + String(confidence), for: UIControl.State.normal)
                dietId2 = dietId
                break
            case 3:
                Button3.setTitle  ("Your earlier result mean we recommend diet " + String(dietId) + " with a confidence of " + String(confidence), for: UIControl.State.normal)
                dietId3 = dietId
                break
            default: break
            }
            count+=1
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Button1Tapped(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowDietSegue", sender: dietId1)
    }
    
    
    @IBAction func Button2Tapped(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowDietSegue", sender: dietId2)
    }
    
    
    
    @IBAction func Button3Tapped(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowDietSegue", sender: dietId3)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowDietSegue") {
            let secondViewController = segue.destination as! ViewDietViewController
            let dietId = sender as! Int32
            secondViewController.dietId = dietId
        }
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
