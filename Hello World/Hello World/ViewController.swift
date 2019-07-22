//
//  ViewController.swift
//  Hello World
//
//  Created by Tintash on 14/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myXibView: MyXibView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        print("viewWillAppear")
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        print("viewDidAppear")
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        print("viewWillDisappear")
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        print("viewDidDisappear")
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("segue called")
//    }
    
    @IBAction func sayHello(_ sender: Any) {
        label.text = "Hello World"
        myXibView.label.text = "You changed me as well???"
    }
    
    @IBAction func presentAnotherVC(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AnotherVC") as? AnotherViewController else { return }
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
}

