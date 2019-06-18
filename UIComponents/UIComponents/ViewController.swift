//
//  ViewController.swift
//  UIComponents
//
//  Created by Tintash on 18/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITabBarControllerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("You selected \(viewController.title ?? "Screen")")
    }
}

