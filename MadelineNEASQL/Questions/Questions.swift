//
//  Questions.swift
//  MadelineNEADietApp
//
//  Created by Madeline on 25/11/2019.
//  Copyright © 2019 Madeline. All rights reserved.
//

import Foundation


class Question {
    let question: String
    let option1: String
    let option2: String
    let option3: String
    var clientAnswer: Int
    
    init(questionText: String, choice1: String, choice2: String, choice3: String, answer: Int){
        
        question = questionText
        option1 = choice1
        option2 = choice2
        option3 = choice3
        clientAnswer = answer
    }
    
}


class QuestionDiary {
    let diaryQuestion: String
    let diaryOption1: String
    let diaryOption2: String
    let diaryOption3: String
    var diaryCorrectAnswer: Int
    
    init(diaryQuestionText: String, diaryChoice1: String, diaryChoice2: String, diaryChoice3: String, diaryAnswer: Int){
        
        diaryQuestion = diaryQuestionText
        diaryOption1 = diaryChoice1
        diaryOption2 = diaryChoice2
        diaryOption3 = diaryChoice3
        diaryCorrectAnswer = diaryAnswer
    }
    
}
