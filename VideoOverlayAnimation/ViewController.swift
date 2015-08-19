//
//  ViewController.swift
//  VideoOverlayAnimation
//
//  Created by Mohsin on 18/08/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices
import AVKit
import MediaPlayer


class ViewController: UIViewController {

    
    var videoAsset : AVURLAsset!
    
    var player:MPMoviePlayerViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    
    
    func loadVideo(){
        self.videoAsset = AVURLAsset(URL: NSBundle.mainBundle().URLForResource("sample", withExtension: ".mp4"), options: nil)
        
    }
    

    
    // run the avplayer for any video or audio
    func playAVPlayer(url: NSURL){
        let av = AVPlayerViewController()
        av.player =  AVPlayer(URL: url)
        self.presentViewController(av, animated: true, completion: nil)
    }
    
    func playVideo(videoURL: NSURL){
        
        player = MPMoviePlayerViewController(contentURL: videoURL)
        //player.moviePlayer.prepareToPlay()
        self.presentMoviePlayerViewControllerAnimated(player)
    }
    
    
    
    @IBAction func play(sender: AnyObject) {
        
        let videoUrl = NSBundle.mainBundle().URLForResource("sample", withExtension: ".mp4")
        let audioUrl = NSBundle.mainBundle().URLForResource("sampleAudio", withExtension: ".mp3")

        
//        self.playVideo(audioUrl!)

        
        VideoOverlay.mergeAudiVideoAndAnimation(audioUrl: audioUrl!, videoUrl: videoUrl!, outputVideName: "animatedVideo", maximumVideoDuration: 20, musicMixLevel: 0.5, audioMixLevel: 1.0) { (outputUrl, errorDesc) -> Void in
            if outputUrl != nil{
                self.playVideo(outputUrl!)
            }
        }
        
    }
    
    
}

