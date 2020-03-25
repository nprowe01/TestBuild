//
//  SignupViewController.swift
//  MadelineNEADietApp
//
//  Created by Madeline on 06/11/2019.
//  Copyright © 2019 Madeline. All rights reserved.
//

import UIKit
import SQLite3


class SignupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var clientDetailsDB: OpaquePointer?
    var clientDetailsList = [ClientDetails]()
    
    
    
    @IBOutlet weak var SignUpTable: UITableView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!

    
    @IBOutlet weak var signinButton: UIButton!
    
    @IBAction func InsertinTableTapped(_ sender: UIButton) {
        let firstNameT = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines);
        let lastNameT = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailT = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordT = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(firstNameT?.isEmpty)!{
            firstNameTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        if(lastNameT?.isEmpty)!{
            lastNameTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        if(emailT?.isEmpty)!{
            emailTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        if(passwordT?.isEmpty)!{
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
        var stmt: OpaquePointer?
        
        let clientDetailsQueryString = "INSERT INTO clientDetails (firstName, lastName, email, password) VALUES (?,?,?,?)"
        let clientDetailsDB = SQLDatabase.shared.getDB()
        if sqlite3_prepare(clientDetailsDB, clientDetailsQueryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 1, strdup(firstNameT), -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, strdup(lastNameT), -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 3, strdup(emailT), -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 4, strdup(passwordT), -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
            print("failure inserting client: \(errmsg)")
            return
        }
        if sqlite3_finalize(stmt) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
            print("failure finalizing client: \(errmsg)")
            return
        }
        
        
        firstNameTextField.text=""
        lastNameTextField.text=""
        emailTextField.text=""
        passwordTextField.text=""
        
        
        readValues()
        signinButton.isHidden = false
        print("Client saved successfully")
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientDetailsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let client: ClientDetails
        client = clientDetailsList[indexPath.row]
        cell.textLabel?.text = client.firstName
        return cell
    }
    
    func readValues(){
        clientDetailsList.removeAll()
        
        let clientDetailsQueryString = "SELECT clientID, firstName, lastName, email, password FROM clientDetails"
        
        var stmt:OpaquePointer?
        let clientDetailsDB = SQLDatabase.shared.getDB()
        if sqlite3_prepare(clientDetailsDB, clientDetailsQueryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let clientID = sqlite3_column_int(stmt, 0)
            let firstName = String(cString: sqlite3_column_text(stmt, 1))
            let lastName = String(cString: sqlite3_column_text(stmt, 2))
            let email = String(cString: sqlite3_column_text(stmt, 3))
            let password = String(cString: sqlite3_column_text(stmt, 4))
            
            
            clientDetailsList.append(ClientDetails(clientID: Int(clientID), firstName: String(describing: firstName), lastName: String(describing: lastName),email: String(describing: email), password: String(describing: password)))
        }
        
        self.SignUpTable.reloadData()
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        
        self.transitionToHome()
    
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //setUpElements()
//        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//            .appendingPathComponent("SQLDietDatabase.sqlite")
//
//
//        if sqlite3_open(fileURL.path, &clientDetailsDB) != SQLITE_OK {
//            print("error opening database")
//        }
//        if sqlite3_exec(clientDetailsDB, "CREATE TABLE IF NOT EXISTS clientDetails (clientID INTEGER PRIMARY KEY AUTOINCREMENT, firstName CHAR(20), lastName CHAR(20), email CHAR(20), password CHAR(20))", nil, nil, nil) != SQLITE_OK {
//            let errmsg = String(cString: sqlite3_errmsg(clientDetailsDB)!)
//            print("error creating table: \(errmsg)")
//        }
//        readValues()
    }

    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}

//    func setUpElements() {
//
//        //hide the error label
//        errorLabel.alpha = 0
//
//        //style the elements
//        Utilities.styleTextField(firstNameTextField)
//
//        Utilities.styleTextField(lastNameTextField)
//
//        Utilities.styleTextField(emailTextField)
//
//        Utilities.styleTextField(passwordTextField)
//
//        Utilities.styleFilledButton(signUpButton)
//
//    }
//
//
//
//
//
//    func showError(_ message:String) {
//        errorLabel.text = message
//        errorLabel.alpha = 1
//    }
//
//
//

