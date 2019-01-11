//
//  account.swift
//  Quizfirebase
//
//  Created by 湯浅克巳 on 2019/01/10.
//  Copyright © 2019 湯浅克巳. All rights reserved.
//

import UIKit

class account: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor(red: 255/255, green: 233/255, blue: 51/255, alpha: 1.0)
        //アイコンの色
        UITabBar.appearance().barTintColor = UIColor(red: 66/255, green: 74/255, blue: 93/255, alpha: 1.0) //
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        // Do any additional setup after loading the view.
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
