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
    
    
    
    func videoOutput(){
        
        // 2 - Create AVMutableComposition object. This object will hold your AVMutableCompositionTrack instances.
        let mixComposition = AVMutableComposition()
        
        // 3 - Video track

        let videoTrack = mixComposition.addMutableTrackWithMediaType(AVMediaTypeVideo, preferredTrackID: CMPersistentTrackID())

        
    }
    
    
    
    
    
    
    
    
    
    
    
    // run the avplayer for any video or audio
    func playAVPlayer(url: NSURL){
        let av = AVPlayerViewController()
        av.player =  AVPlayer(URL: url)
        self.presentViewController(av, animated: true, completion: nil)
    }
    
    func playVideo(videoURL: NSURL){
        
        player = MPMoviePlayerViewController(contentURL: videoURL)
        
        self.presentMoviePlayerViewControllerAnimated(player)
    }
    
    
    
    @IBAction func play(sender: AnyObject) {
        
        let videoUrl = NSBundle.mainBundle().URLForResource("sample", withExtension: ".mp4")

        let audioUrl = NSBundle.mainBundle().URLForResource("sampleAudio", withExtension: ".mp3")

        VideoOverlay.mergeAudiVideoAndAnimation(audioUrl: audioUrl!, videoUrl: videoUrl!, outputVideName: "animatedVideo", maximumVideoDuration: 20, musicMixLevel: 0.0, audioMixLevel: 0.0) { (outputUrl, errorDesc) -> Void in
            if outputUrl != nil{
                self.playVideo(outputUrl!)
            }
        }
    }
    
    
}

