//
//  ViewController.swift
//  UITableView
//
//  Created by Tintash on 18/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var items = [Int]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewNib: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewNib.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        for i in 0...100{
            items.append(i)
        }
    }
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView{
            return items.count/2
        } else if tableView == self.tableViewNib{
            return items.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.tableView{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? AnotherTableViewCell {
                cell.textLabel?.text = "\(items[indexPath.row])"
                return cell
            } else {
                let cell = AnotherTableViewCell(style: .default, reuseIdentifier: "MyCell")
                cell.textLabel?.text = "\(items[indexPath.row])"
                return cell
            }
        } else if tableView == self.tableViewNib{
            if let cell = tableViewNib.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell {
                cell.label.text = "Nib: \(items[indexPath.row])"
                return cell
            } else {
                let cell = TableViewCell(style: .default, reuseIdentifier: "TableViewCell")
                cell.label.text = "Nib: \(items[indexPath.row])"
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == self.tableView{
            return "My Table View Cells Header"
        }
        else if tableView == self.tableViewNib{
            return "My Nib Based Table View Cells Header"
        }
        return "Table Views Header"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if tableView == self.tableView{
            return "My Table View Cells Footer"
        }
        else if tableView == self.tableViewNib{
            return "My Nib Based Table View Cells Footer"
        }
        return "Table Views Footer"
    }
}

extension ViewController: UITableViewDelegate{
    
}

