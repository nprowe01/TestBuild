//
//  DiaryViewController.swift
//  MadelineNEADietApp
//
//  Created by Madeline on 23/11/2019.
//  Copyright © 2019 Madeline. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController {
    
    @IBOutlet weak var diaryButton1: UIButton!
    
    @IBOutlet weak var diaryButton2: UIButton!
    
    @IBOutlet weak var diaryButton3: UIButton!
    
    @IBOutlet weak var diaryQuestionLabel: UILabel!
    
    @IBOutlet weak var returnToHomepage: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestionDiary()

        // Do any additional setup after loading the view.
    }
    
    let diaryQuestions = QuestionBankDiary()
    var diaryQuestionNumber: Int = 0
    var score:Int = 0
    var diarySelectedAnswer:Int = 0
//
//
    @IBAction func choicePressed(_ sender: Any) {
        updateQuestionDiary()
        
        
    }


    func updateQuestionDiary() {
               returnToHomepage.isHidden = true
               diaryQuestionLabel.text = diaryQuestions.list[diaryQuestionNumber].diaryQuestion
               diaryButton1.setTitle(diaryQuestions.list[diaryQuestionNumber].diaryOption1, for: UIControl.State.normal)
               diaryButton2.setTitle(diaryQuestions.list[diaryQuestionNumber].diaryOption2, for: UIControl.State.normal)
               diaryButton3.setTitle(diaryQuestions.list[diaryQuestionNumber].diaryOption3, for: UIControl.State.normal)

               diarySelectedAnswer = diaryQuestions.list[diaryQuestionNumber].diaryCorrectAnswer
               if diaryQuestionNumber < (diaryQuestions.list.count-1){
                  diaryQuestionNumber += 1
               }else{
                   returnToHomepage.isHidden = false
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
}

