//
//  ViewDietViewController.swift
//  MadelineNEASQL
//
//  Created by Madeline on 26/03/2020.
//  Copyright © 2020 Madeline. All rights reserved.
//

import UIKit
import SQLite3

class ViewDietViewController: UIViewController {
    var dietId : Int32?
    
    @IBOutlet weak var dietTitleLabel: UILabel!
    
    @IBOutlet weak var dietTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = SQLDatabase.shared.getDB()
        
        let query = "SELECT dietTitle, dietText FROM DietData WHERE DietID = ?"
        var stmt : OpaquePointer?
        
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 1, dietId!) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure bind : \(errmsg)")
            return
        }
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let dietTitle =  String(cString: sqlite3_column_text(stmt, 0))
            let dietText =  String(cString: sqlite3_column_text(stmt, 1))
            dietTitleLabel.text = dietTitle
            dietTextLabel.text = dietText
            
        }
        
        
        if sqlite3_finalize(stmt) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure finalizing : \(errmsg)")
            return
        }
        
        
        
        
        
        
        
        
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
