//
//  ViewController.swift
//  Networking
//
//  Created by Tintash on 25/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class Networking{
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        httpPostRequest()
        
    }


    func httpGetRequest(){
        let session = URLSession.shared
        let url = URL(string: "https://learnappmaking.com/ex/users.json")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil || data == nil{
                print("Client Error!")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else
            {
                print("Server Error!")
                return
            }
            
            guard let mimeType = response?.mimeType, mimeType == "application/json" else{
                print("Wrong MIME type!")
                return
            }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch{
                print("JSON error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func httpPostRequest(){
        let session = URLSession.shared
        let url = URL(string: "https://example.com/post")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")
        
        let json = ["username": "Saad_Tahir", "message":"Hey! How you doin buddy?"]
        
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
            let task = session.uploadTask(with: request, from: jsonData) { (data, response, error) in
                
                if let httpResponse = response as? HTTPURLResponse{
                    print("Error: \(httpResponse.statusCode)")
                    return
                }
                
                if let data = data, let dataString = String(data: data, encoding: .utf8){
                    print(dataString)
                }
            }
            
            task.resume()
            
        } catch{
            print("Failed to parse data to JSON")
        }
    }
}
