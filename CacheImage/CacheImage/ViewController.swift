//
//  ViewController.swift
//  CacheImage
//
//  Created by Tintash on 25/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    //Create an NSCache Instance
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var cacheImage: UIImageView!
    
    let url = "https://i.imgur.com/w5rkSIj.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        image1.backgroundColor = .red
        cacheImage.backgroundColor = .blue
        
        image1.cacheImage(urlString: url)

    }

    @IBAction func buttonClicked(_ sender: Any) {
        cacheImage.cacheImage(urlString: url)
    }
    
}


let imageCache = NSCache<AnyObject,AnyObject>()

extension UIImageView{
    
    func cacheImage(urlString: String){
        let url = URL(string: urlString)
        
        self.image = nil
        
        //do we have an image present in the cache for a certain key?
        if let imageForCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = imageForCache
            return
        }
        
        //create a url request for image and then cache it
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let response = data{
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                    self.image = imageToCache
                }
            }
            }.resume()
        
    }
    
}

