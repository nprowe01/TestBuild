//
//  ViewController.swift
//  MadelineNEADietApp
//
//  Created by Madeline on 06/11/2019.
//  Copyright © 2019 Madeline. All rights reserved.
//

import UIKit
import AVKit
import SQLite3


class ViewController: UIViewController {
    
    
    var videoPlayer: AVPlayer?
    
    var videoPlayerLayer: AVPlayerLayer?
    
  
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
//Do any additional setup after loading the view.
        
    
       setupElements()
       // createDietData()
       // createClientData()
      //  createClientInput()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // set up video in the background
        setUpVideo()
    }

    func setupElements() {
        Utilities.styleFilledButton(signUpButton)
        
        Utilities.styleHollowButton(loginButton)
        
        
        
    }
    
    func setUpVideo() {
        
        // get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mov")
        
        guard bundlePath != nil else{
            return
        }
        
        // create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        
        // create the video player item
        let item = AVPlayerItem(url: url)
        
        //create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        //create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        
        //adjust the size and feame
        videoPlayerLayer?.frame = CGRect(x:
            -self.view.frame.size.width*1.5,y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // add it to the view and play it
        videoPlayer?.playImmediately(atRate: 0.3)
        
        
        
    }
    

    
    
    


}
