//
//  ClientDetails.swift
//  MadelineNEASQL
//
//  Created by Madeline on 20/02/2020.
//  Copyright © 2020 Madeline. All rights reserved.
//

import Foundation
import SQLite3

class ClientDetails {
    
    var clientID: Int
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    
    init(clientID: Int, firstName: String?, lastName: String?, email: String?, password: String?){
        self.clientID = clientID
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        
    }
}
