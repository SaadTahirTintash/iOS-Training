//
//  ViewController.swift
//  AlamofireTutorial
//
//  Created by Tintash on 18/07/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

fileprivate let api = "http://citechdev.com/ci/APIs/usersSwiftAlamofireExample.json"
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var users = [UserModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    func staticData(){
        let user1 = UserModel(name: "Saad", email: "saad@gmail.com")
        let user2 = UserModel(name: "Usman", email: "usman@gmail.com")
        users.append(user1)
        users.append(user2)
    }
    func fetchData(){
        DispatchQueue.global().async {
            //do heavy operation here
            Alamofire.request(api).responseJSON { [weak self](response) in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    let data = json["data"]
                    data["users"].array?.forEach({ [weak self](user) in
                        let user = UserModel(name: user["name"].stringValue, email: user["email"].stringValue)
                        self?.users.append(user)
                    })
                    DispatchQueue.main.async {
                        //update UI here
                        self?.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableViewCell
        cell.nameLabel.text = users[indexPath.row].name
        cell.emailLabel.text = users[indexPath.row].email
        return cell
    }
}

