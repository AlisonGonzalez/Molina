//
//  ReproducirPodcastViewController.swift
//  CONCEPTO
//
//  Created by Alfredo on 3/24/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ReproducirPodcastViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var playButton: UIButton!
    var nombre: String = ""
    var link: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        name.text = nombre
        PodcastPlayer.sharedInstance.setURL(url: link)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    @IBAction func reproducir(_ sender: UIButton) {
        toggle()
    }
    
    func toggle() {
        if PodcastPlayer.sharedInstance.currentlyPlaying() {
            pausePodcast()
        } else {
            playPodcast()
        }
    }
    
    func playPodcast() {
        playButton.setImage(#imageLiteral(resourceName: "pause"), for: UIControlState.normal)
        PodcastPlayer.sharedInstance.play()
    }
    
    func pausePodcast() {
        playButton.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
        PodcastPlayer.sharedInstance.pause()
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                PodcastPlayer.sharedInstance.forward()
            case UISwipeGestureRecognizerDirection.left:
                PodcastPlayer.sharedInstance.rewind()
            default:
                break
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
