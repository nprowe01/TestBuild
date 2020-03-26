//
//  ClientResults.swift
//  MadelineNEASQL
//
//  Created by Neville Rowe on 26/03/2020.
//  Copyright © 2020 Madeline. All rights reserved.
//

import Foundation

class ClientResults {
    
    var inputId: Int32
    var dietId: Int32
    var confidence: Int32
    
    init(inputId: Int32, dietId: Int32, confidence: Int32){
        self.inputId = inputId
        self.dietId = dietId
        self.confidence = confidence
    }
}
