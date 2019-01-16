//
//  ViewController.swift
//  Login Do Try Catch
//
//  Created by Joseph Ward on 16/01/19.
//  Copyright © 2019 Joethermal. All rights reserved.
//

import UIKit


enum LoginError: Error {
    case incompleteForm
    case invalidEmail
    case incorrectPasswordLength
}

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        do {
            try login()
            //transition to next screen here...
                
            } catch LoginError.incompleteForm {
                Alert.showBasic(title: "Incomplete Form", message: "Please fill in email and password fields", vc: self)
            } catch LoginError.invalidEmail {
                Alert.showBasic(title: "Invalid email", message: "Please enter a valid email", vc: self)
            } catch LoginError.incorrectPasswordLength {
                Alert.showBasic(title: "Password too short", message: "Should be at least 8 characters long", vc: self)
            } catch {
                Alert.showBasic(title: "Unable to login", message: "There was an error", vc: self)
            }
        
        
    }
    

    func login() throws {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        
        if password.count < 8 {
            throw LoginError.incorrectPasswordLength
        }
        
        
        
    }


}

