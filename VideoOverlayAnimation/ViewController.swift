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


class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    
    var videoAsset : AVURLAsset!
    
    var player:MPMoviePlayerViewController!
    var videoPicker = UIImagePickerController()
    
    let sampleVideoUrl = NSBundle.mainBundle().URLForResource("sample", withExtension: ".mp4")
    let sampleAudioUrl = NSBundle.mainBundle().URLForResource("sampleAudio", withExtension: ".mp3")
    
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
    
    
    
    
    //Action sheet camera
    func cameraClick(){
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            
            self.videoPicker.delegate = self
            self.videoPicker.allowsEditing = true
            self.videoPicker.videoQuality = UIImagePickerControllerQualityType.TypeIFrame1280x720
            self.videoPicker.sourceType = UIImagePickerControllerSourceType.Camera
            //self.videoPicker.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(.Camera)!
            self.videoPicker.mediaTypes = [kUTTypeMovie as NSString]
            self.videoPicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureMode.Video
            self.videoPicker.videoMaximumDuration = 24.0
            
            self.presentViewController(self.videoPicker, animated: true, completion: nil)
            
        }
    }
    
    //Action sheet photolib
    func photoLib(){
        
        self.videoPicker.delegate = self
        // show the alert for the video duration
        self.videoPicker.allowsEditing = true
        self.videoPicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        //videoPicker.modalPresentationStyle = UIModalPresentationStyle.FullScreen
        self.videoPicker.mediaTypes = [kUTTypeMovie as NSString]
        self.videoPicker.videoQuality = UIImagePickerControllerQualityType.TypeIFrame1280x720
        
        self.presentViewController(self.videoPicker, animated: true, completion: nil)
    }
    
    //What to do when the picker returns with a video
    func imagePickerController(videoPicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        
        if mediaType.isEqualToString(kUTTypeMovie as String) {
            
            // Media is a video
            let videoUrl = info[UIImagePickerControllerMediaURL] as! NSURL
            
            
            VideoOverlay.mergeAudiVideoAndAnimation(audioUrl: self.sampleAudioUrl!, videoUrl: videoUrl, outputVideName: "animatedVideo", maximumVideoDuration: 20, musicMixLevel: 0.5, audioMixLevel: 1.0) { (outputUrl, errorDesc) -> Void in
                if outputUrl != nil{
                    self.playVideo(outputUrl!)
                }
            }
            
            
            dismissViewControllerAnimated(true, completion: nil)
            
        }
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
    
    
    @IBAction func camera(sender: UIButton) {
        self.cameraClick()
    }
    
    @IBAction func Lib(sender: AnyObject) {

        self.photoLib()
        
//        self.playVideo(audioUrl!)
        
    }
    
    
}

