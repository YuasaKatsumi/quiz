//
//  NewUserViewController.swift
//  Quizfirebase
//
//  Created by 湯浅克巳 on 2019/01/13.
//  Copyright © 2019 湯浅克巳. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class NewUserViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func createNewUser(_ sender: Any) {
        if emailTF.text == nil || passwordTF.text == nil{
            let alertViewController = UIAlertController(title: "おっと", message: "入力欄が空の状態です", preferredStyle: .alert)
            let okaction = UIAlertAction(title: "OK"
                , style: .default, handler: nil)
            alertViewController.addAction(okaction)
            present(alertViewController,animated: true,completion: nil)
            
            
        }else{
        Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!, completion: {(user,error) in
            if error == nil{
                
                UserDefaults.standard.set("check",forKey: "check")
                self.dismiss(animated: true, completion: nil)
            }else{
                //失敗した
                let alertViewController = UIAlertController(title: "えっと", message: error?.localizedDescription, preferredStyle: .alert)
                let okaction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                alertViewController.addAction(okaction)
                self.present(alertViewController,animated: true,completion: nil)
                
            }
        })
    }
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
