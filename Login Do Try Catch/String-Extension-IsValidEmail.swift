//
//  String-Extension-IsValidEmail.swift
//  AlertTest
//
//  Created by Joseph Ward on 16/01/19.
//  Copyright © 2019 Joethermal. All rights reserved.
//

import Foundation

extension String {
    
    var isValidEmail : Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with:self)
    }
    
}


/* HOW IT WORKS
 
 let email = "joethermal@gmail.com"
 
 if email.isValidEmail {
 print("valid email")
 }else{
 print("not a valid email")
 }
 
 */
