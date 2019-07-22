//
//  ViewController.swift
//  Layout
//
//  Created by Tintash on 12/07/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var toggle = false
    var array = ["This a short title","This is a looooooooooooooong looooooooooooooong looooooooooooooong looooooooooooooong looooooooooooooong title"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = array[0]
    }

    @IBAction func toggleLabelText(){
        label.text = toggle ? array[0] : array[1]
        toggle.toggle()
    }

}

