//
//  QuestionBankDiary.swift
//  MadelineNEADietApp
//
//  Created by Madeline on 04/12/2019.
//  Copyright © 2019 Madeline. All rights reserved.
//

import Foundation


class QuestionBankDiary {
    var list = [QuestionDiary]()
    
    init(){
        list.append(QuestionDiary(diaryQuestionText: "On a scale of 1-3 how much are you enjoying your diet", diaryChoice1: "1. Not enjoying it", diaryChoice2: "2. It's okay", diaryChoice3: "I'm enjoying it", diaryAnswer: 1))
        list.append(QuestionDiary(diaryQuestionText: "Is there long-term potential?", diaryChoice1: "1. Yes", diaryChoice2: "2. No", diaryChoice3: "3. Maybe", diaryAnswer: 1))
          list.append(QuestionDiary(diaryQuestionText: "End of log", diaryChoice1: "", diaryChoice2: "", diaryChoice3: "", diaryAnswer: 1))
        //list.append(QuestionDiary(diaryQuestionText: "On a scale of 1-3 how much are you enjoying your diet", diaryChoice1: "1. Not enjoying it", diaryChoice2: "2. It's okay", diaryChoice3: "I'm enjoying it", diaryAnswer: 1))
      
      
        
        
    }
}
