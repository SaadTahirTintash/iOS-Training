//
//  ViewController.swift
//  Youtube Player
//
//  Created by Tintash on 27/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

//https://www.youtube.com/watch?v=BzSA9fhfan0
fileprivate let YOUTUBE_LINK = "BzSA9fhfan0"

class ViewController: UIViewController {
    
    @IBOutlet weak var youtubeView: YTPlayerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        youtubeView.load(withVideoId: YOUTUBE_LINK, playerVars:["playsinline":1])
        
    }
}

