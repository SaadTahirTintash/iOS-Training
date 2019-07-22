//
//  AnotherViewController.swift
//  Hello World
//
//  Created by Tintash on 14/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class AnotherViewController: UIViewController {
    
    let a = 10
    var b : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("another viewDidLoad")
        // Do any additional setup after loading the view.
    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        print("another viewWillAppear")
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        print("another viewDidAppear")
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        print("another viewWillDisappear")
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        print("another viewDidDisappear")
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("another segue called")
//    }
    
    @IBAction func presentVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
