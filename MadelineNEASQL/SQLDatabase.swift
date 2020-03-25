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
            if sqlite3_exec(clientDetailsDB, "CREATE TABLE IF NOT EXISTS clientDetails (clientID INTEGER PRIMARY KEY AUTOINCREMENT, firstName CHAR(20), lastName CHAR(20), email CHAR(20), password CHAR(20))", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error creating ClientDetails table: \(errmsg)")
            }
            if sqlite3_exec(clientDetailsDB, "CREATE TABLE IF NOT EXISTS clientInput (inputID INTEGER PRIMARY KEY AUTOINCREMENT, DietaryRestrictions INTEGER, Cost INTEGER, Rules INTEGER, MedicalCon INTEGER, Support INTEGER, Time INTEGER)", nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
                print("error creating ClientInput table: \(errmsg)")
            }
        }
    }
    
    func getDB() -> OpaquePointer? {
        return clientDetailsDB
    }
}
