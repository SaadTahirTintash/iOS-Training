//
//  ViewController.swift
//  UIComponents
//
//  Created by Tintash on 18/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    
    let vc1 = ViewController1()
    let vc2 = ViewController2()
    let vc3 = ViewController3()


    override func viewDidLoad() {
        super.viewDidLoad()
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        //so that the view properties are all set
        vc1.viewDidLoad()
        vc2.viewDidLoad()
        vc3.viewDidLoad()
        
        let viewControllerList = [vc1,vc2,vc3]
        viewControllers = viewControllerList
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            print("\(vc1.title ?? "Screen") Selected")
        case 1:
            print("\(vc2.title ?? "Screen") Selected")
        case 2:
            print("\(vc3.title ?? "Screen") Selected")
        default:
            print("Something Selected")
        }
    }
    
}

