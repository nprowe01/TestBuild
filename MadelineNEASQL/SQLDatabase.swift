//
//  SQLDatabase.swift
//  MadelineNEASQL
//
//  Created by Madeline on 19/03/2020.
//  Copyright © 2020 Madeline. All rights reserved.
//

import Foundation
import SQLite3

class SQLDatabase {
    
    static let shared = SQLDatabase()
    
    private var clientDetailsDB: OpaquePointer?
    
    private init() {
        if clientDetailsDB == nil {
            let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("SQLDietDatabase.sqlite")
            if sqlite3_open(fileURL.path, &clientDetailsDB) != SQLITE_OK {
                print("error opening database")
            }
            if sqlite3_exec(clientDetailsDB, "DROP TABLE IF EXISTS ClientDetails", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error dropping CLientDetails table: \(errmsg)")
            }
            if sqlite3_exec(clientDetailsDB, "CREATE TABLE IF NOT EXISTS clientDetails (clientID INTEGER PRIMARY KEY AUTOINCREMENT, firstName CHAR(20), lastName CHAR(20), email CHAR(20), password CHAR(20))", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error creating ClientDetails table: \(errmsg)")
            }
            if sqlite3_exec(clientDetailsDB, "DROP TABLE IF EXISTS clientInput", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error dropping CLientDetails table: \(errmsg)")
            }
            if sqlite3_exec(clientDetailsDB, "CREATE TABLE IF NOT EXISTS clientInput (inputID INTEGER PRIMARY KEY AUTOINCREMENT, DietaryRestrictions INTEGER, Cost INTEGER, Rules INTEGER, MedicalCon INTEGER, Support INTEGER, Time INTEGER)", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error creating ClientInput table: \(errmsg)")
            }
            if sqlite3_exec(clientDetailsDB, "DROP TABLE IF EXISTS DietData", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error dropping DietData table: \(errmsg)")
            }
            if sqlite3_exec(clientDetailsDB, "CREATE TABLE IF NOT EXISTS DietData (dietID INTEGER PRIMARY KEY, dietTitle text, dietText text, DietaryRestrictions INTEGER, Cost INTEGER, Rules INTEGER, MedicalCon INTEGER, Support INTEGER, Time INTEGER)", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error creating DietData table: \(errmsg)")
            }
            if sqlite3_exec(clientDetailsDB, "insert into DietData (dietID, dietTitle, dietText, DietaryRestrictions, Cost, Rules, MedicalCon, Support, Time) values (1, 'Weight Watchers', 'WW is a points-based system that assigns different foods and beverages a value, To reach your desired weight, you must stay within your daily point allowance.', 1, 2, 1, 1, 3, 1)", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error cleaning DietData table: \(errmsg)")
            }
            
            
            
            if sqlite3_exec(clientDetailsDB, "insert into DietData (dietID, dietTitle, dietText, DietaryRestrictions, Cost, Rules, MedicalCon, Support, Time) values (2, '5:2 diet', '5 days eating what you want, 2 days restrictive low calorie', 1, 2, 2, 1, 1, 2)", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error cleaning DietData table: \(errmsg)")
            }
            
            if sqlite3_exec(clientDetailsDB, "insert into DietData (dietID, dietTitle, dietText, DietaryRestrictions, Cost, Rules, MedicalCon, Support, Time) values (3, 'Keto Diet', 'Low-carb diets restrict your carb intake in favor of protein and fat.', 1, 2, 1, 1, 2, 2)", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error cleaning DietData table: \(errmsg)")
            }
            
            
            
            if sqlite3_exec(clientDetailsDB, "insert into DietData (dietID, dietTitle, dietText, DietaryRestrictions, Cost, Rules, MedicalCon, Support, Time) values (4, 'Wholefoods diet', 'Restricts animal products for health, ethical, and environmental reasons', 1, 3, 2, 1, 1, 3)", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error cleaning DietData table: \(errmsg)")
            }
            
            
            
            if sqlite3_exec(clientDetailsDB, "insert into DietData (dietID, dietTitle, dietText, DietaryRestrictions, Cost, Rules, MedicalCon, Support, Time) values (5, 'Paleo diet', 'The paleo diet advocates eating the same foods that your hunter-gatherer ancestors allegedly ate', 1, 2, 1, 1, 1, 3)", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error cleaning DietData table: \(errmsg)")
            }
            
            
        
            
            if sqlite3_exec(clientDetailsDB, "insert into DietData (dietID, dietTitle, dietText, DietaryRestrictions, Cost, Rules, MedicalCon, Support, Time) values (6, 'Low-fat diet e.g the rosemary conley diet', 'ELow-fat diets restrict fat intake because fat provides about twice the number of calories per gram, compared with the other two macronutrients — protein and carbs.', 2, 2, 2, 1, 1, 2)", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error cleaning DietData table: \(errmsg)")
            }
            
            if sqlite3_exec(clientDetailsDB, "insert into DietData (dietID, dietTitle, dietText, DietaryRestrictions, Cost, Rules, MedicalCon, Support, Time) values (7, 'Medditeranean diet', 'The Mediterranean diet is based on foods that people in countries like Italy and Greece used to eat. Though it was designed to lower heart disease risk, numerous studies indicate that it can also aid weight loss.', 1, 3, 2, 2, 1, 2)", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error cleaning DietData table: \(errmsg)")
            }
            
            if sqlite3_exec(clientDetailsDB, "insert into DietData (dietID, dietTitle, dietText, DietaryRestrictions, Cost, Rules, MedicalCon, Support, Time) values (8, 'DASH diet', 'Dietary Approaches to Stop Hypertension, or DASH diet, is an eating plan that is designed to help treat or prevent high blood pressure, which is clinically known as hypertension.', 2, 2, 1, 2, 1, 2)", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error cleaning DietData table: \(errmsg)")
            }
        }
    }
    
    func getDB() -> OpaquePointer? {
        return clientDetailsDB
    }
}
