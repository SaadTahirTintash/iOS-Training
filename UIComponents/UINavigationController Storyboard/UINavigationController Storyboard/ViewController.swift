//
//  ViewController.swift
//  UINavigationController Storyboard
//
//  Created by Tintash on 18/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController2{
            print("Going to \(vc.navigationItem.title ?? "Screen")")
        }
    }
}

