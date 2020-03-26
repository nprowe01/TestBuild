//
//  ClientInput.swift
//  MadelineNEASQL
//
//  Created by Madeline on 22/03/2020.
//  Copyright © 2020 Madeline. All rights reserved.
//

import Foundation

class ClientInput {
    
    var dietaryRestrictions: Int32
    var cost: Int32
    var rules: Int32
    var medicalCon: Int32
    var support: Int32
    var time: Int32
    
    init(dietaryRestrictions: Int32, cost: Int32, rules: Int32, medicalCon: Int32, support: Int32, time: Int32){
        self.dietaryRestrictions = dietaryRestrictions
        self.cost = cost
        self.rules = rules
        self.medicalCon = medicalCon
        self.support = support
        self.time = time
        
    }
}

