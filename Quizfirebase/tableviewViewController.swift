//
//  tableviewViewController.swift
//  Quizfirebase
//
//  Created by 湯浅克巳 on 2019/01/10.
//  Copyright © 2019 湯浅克巳. All rights reserved.
//

import UIKit
import Firebase
class tableviewViewController: UIViewController,UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate {
    @IBOutlet weak var tableview: UITableView!
    let refreshControll = UIRefreshControl()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //セルの数
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        //ラベルずけをする
        return cell
    }
   // func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //ボタンどうする
     //   

    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        refreshControll.attributedTitle = NSAttributedString(string: "引っ張って更新")
        refreshControll.addTarget(self, action:#selector(refresh), for:UIControl.Event.valueChanged)
        var items = [NSDictionary]()
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "check") != nil{
            
        }else{
            let loginViewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "login")
            self.present(loginViewcontroller!,animated: true,completion: nil)
            
        }
        
        func loadAllData(){
            //https://officalquizfirebase.firebaseio.com/
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            let firebase = Database.database().reference(fromURL:"https://officalquizfirebase.firebaseio.com/").child("posts")
            firebase.queryLimited(toLast: 10).observe(.value) {(snapshots,error) in
                var tempitems = [NSDictionary]()
                for item in (snapshots.children){
                    let child = item as! DataSnapshot
                    let dict = child.value
                    tempitems.append(dict as! NSDictionary)
                    
                }
              // self.itmes = tempitems
            //self.items = self.items.reversed()
                self.tableview.reloadData()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                

            }
        }
    }
    @objc func refresh(){
      //  items = [NSDictionary]()
        //loadAllData()
        tableview.reloadData()
        refreshControll.endRefreshing()
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

