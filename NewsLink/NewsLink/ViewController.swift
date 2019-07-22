//
//  ViewController.swift
//  NewsLink
//
//  Created by Tintash on 08/07/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit
import SwiftLinkPreview

class ViewController: UIViewController {

    let url = "https://www.nationalgallery.org.uk"
    
    @IBOutlet weak var someimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let slp = SwiftLinkPreview()
        slp.preview(
            url,
            onSuccess: { response in
                print("Result: \(String(describing: response.images))")
                print("Resulted Img: \(String(describing: response.images?[0]))")
                guard let imgURL = response.images?[6] else{
                    return
                }
                self.someimage.load(from: URL(string: imgURL)!)
        },
            onError: { error in
                
                print("Error: \(error)")
                
        }
        )
    }


}

extension UIImageView{
    func load(from url: URL){
        DispatchQueue.global().async { [weak self] in
            print("Image Loaded")
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
            else{
                print("Image Loading error")
            }
        }
        print("Loading Image")
    }
}
