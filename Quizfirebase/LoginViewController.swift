//
//  LoginViewController.swift
//  Quizfirebase
//
//  Created by 湯浅克巳 on 2019/01/13.
//  Copyright © 2019 湯浅克巳. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginemailTF: UITextField!
    
    @IBOutlet weak var loginpasswaordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //
    @IBAction func LogIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: loginemailTF.text!, password: loginpasswaordTF.text!){ (user, error) in
            if (user != nil && error == nil) {
                self.dismiss(animated: true, completion: nil)
                UserDefaults.standard.set("check", forKey: "check")
            } else {              //失敗
                let alertViewController = UIAlertController(title: "おっと!", message:error?.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertViewController.addAction(okAction)
                self.present(alertViewController, animated:true, completion:nil)
                
            }
        }
    }
}

