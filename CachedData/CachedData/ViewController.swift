//
//  ViewController.swift
//  CachedData
//
//  Created by Tintash on 25/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

struct DataStuct {
    var imageUrl: String?
    var description: String?
    var image: UIImage? = nil
    
    init(add: NSDictionary){
        imageUrl = add["url"] as? String
        description = add["description"] as? String
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var json_data_url = "http://www.kaleidosblog.com/tutorial/json_table_view_images.json"
    var image_base_url = "http://www.kaleidosblog.com/tutorial/"
    var tableData: Array<DataStuct> = Array<DataStuct>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")!
        var data = tableData[indexPath.row]
        cell.textLabel?.text = data.description
        if data.image == nil{
            cell.imageView?.image = UIImage(named: "image.jpg")
        }
        else{
            cell.imageView?.image = data.image
        }
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
}

