//
//  QuestionsViewController.swift
//  MadelineNEADietApp
//
//  Created by Madeline on 25/11/2019.
//  Copyright © 2019 Madeline. All rights reserved.
//

import UIKit
import SQLite3

class QuestionsViewController: UIViewController {
    
    
    //    // Outlet for buttons
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    
    @IBOutlet weak var findResultsButton: UIButton!
    
    
    @IBOutlet weak var questionCounter: UILabel!
    
    @IBOutlet weak var questions: UILabel!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score:Int = 0
    var selectedAnswer:Int = 0
    var clientInputDB: OpaquePointer?
    var clientInputList = [ClientInput]()
    
    @IBAction func answerPressed(_ sender: UIButton) {
        allQuestions.list[questionNumber-1].clientAnswer = sender.tag
        updateQuestion()
    }
    func updateQuestion() {
        findResultsButton.isHidden = true
        questionLabel.text = allQuestions.list[questionNumber].question
        button1.setTitle(allQuestions.list[questionNumber].option1, for: UIControl.State.normal)
        button2.setTitle(allQuestions.list[questionNumber].option2, for: UIControl.State.normal)
        button3.setTitle(allQuestions.list[questionNumber].option3, for: UIControl.State.normal)
        selectedAnswer = allQuestions.list[questionNumber].clientAnswer
        if questionNumber < (allQuestions.list.count-1){
            questionNumber += 1
        }else{
            findResultsButton.isHidden = false
            var stmt: OpaquePointer?
            
            let clientInputQueryString = "INSERT INTO clientInput (dietaryRestrictions, cost, rules, medicalCon, support, time) VALUES (?,?,?,?,?,?)"
            let clientInputDB = SQLDatabase.shared.getDB()
            if sqlite3_prepare(clientInputDB, clientInputQueryString, -1, &stmt, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(clientInputDB)!)
                print("error preparing insert: \(errmsg)")
                return
            }
            for i in 0...(allQuestions.list.count - 2){
                if sqlite3_bind_int(stmt, Int32(i+1), Int32(allQuestions.list[i].clientAnswer)) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(clientInputDB)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
            }
            if sqlite3_step(stmt) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(clientInputDB)!)
                print("failure inserting client input: \(errmsg)")
                return
            }
            if sqlite3_finalize(stmt) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(clientInputDB)!)
                print("failure finalizing client input\(errmsg)")
                return
            }
            
        }
        updateUI()
        //
        //
    }
    //
    //
    func updateUI(){
        questionCounter.text = "\(questionNumber)/\(allQuestions.list.count-1)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    //
    
    //    /*
    //     MARK: - Navigation
    //
    //     In a storyboard-based application, you will often want to do a little preparation before navigation
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //         Get the new view controller using segue.destination.
    //         Pass the selected object to the new view controller.
    //    }
    //    */
    //
    //
    //}
    
    
}

