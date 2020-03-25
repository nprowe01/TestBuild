//
//  QuestionBank.swift
//  MadelineNEADietApp
//
//  Created by Madeline on 25/11/2019.
//  Copyright © 2019 Madeline. All rights reserved.
//

import Foundation

class QuestionBank{
    var list = [Question]()
    
    init(){
        list.append(Question(questionText: "Do you have any dietary restrictions", choice1: "1. Yes", choice2: "2. No", choice3: "", answer: 1))
      //  list.append(Question(questionText: "How busy are you on a scale of 1-3?", choice1: "1. Lots of free time", choice2: "2. Some free time", choice3: "3. Very busy", answer: 1))
        list.append(Question(questionText: "How much money do you want to spend on a scale of 1-3?", choice1: "1. As little as possible", choice2: "2. Nothing too expensive", choice3: "3. Money no object", answer: 1))
        //list.append(Question(questionText: "Would you like a simple or complex diet?", choice1: "1. Simple", choice2: "2. Complex", choice3: "3. I don't mind", answer: 1))
        list.append(Question(questionText: "Do you want flexibility or strict rules?", choice1: "1. Flexibility", choice2: "2. Strict rules", choice3: "", answer: 1))
        list.append(Question(questionText: "Do you have any medical conditions?", choice1: "1. None", choice2: "2. Heart related", choice3: "3. Diabetes", answer: 1))
        list.append(Question(questionText: "Do you struggle with dieting?", choice1: "1. No", choice2: "2. A little", choice3: "3. A lot", answer: 1))
        list.append(Question(questionText: "How much time do you want to spend cooking", choice1: "1. 0-15min ", choice2: "2. 15-30min", choice3: "3. 30min+", answer: 1))
         list.append(Question(questionText: "End of Quiz", choice1: "", choice2: "", choice3: "", answer: 1))
        
        
    }
}
