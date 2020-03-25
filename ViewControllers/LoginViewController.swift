//
//  LoginViewController.swift
//  MadelineNEADietApp
//
//  Created by Madeline on 06/11/2019.
//  Copyright © 2019 Madeline. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    

    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
        
        
    }
    
    
    func setUpElements() {

        // hide the error label
        errorLabel.alpha = 0

        // style the elements

        Utilities.styleTextField(emailTextField)

        Utilities.styleTextField(passwordTextField)

        Utilities.styleFilledButton(loginButton)


    }

//
//
//
//
//
//
//
//
//
//
//
//    @IBAction func returntostarttapped(_ sender: Any) {
//
//        //CODE FOR WHEN BUTTON IS CLICKED TO MOVE BACK TO VIEWCONTROLLER
//
//
//
//
//
//    }
//
//
//
  @IBAction func loginTapped(_ sender: Any) {
    

        // TODO: Validate text fields
    
    
   // create cleaned versions of the text field
    // uncomment these when you are ready to do the login process
//    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//    let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    
    
    //Signing in the user
    //NEED TO DO IN SQL
    print("Signing in user")
    
    //create error if statement so user cannot log in with wrong email/password
    
     func transitionToHome() {
            //Transition to home screen
            let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
            view.window?.rootViewController = homeViewController
            view.window?.makeKeyAndVisible()


        }

    transitionToHome()

    
    
    
    
    }

}
