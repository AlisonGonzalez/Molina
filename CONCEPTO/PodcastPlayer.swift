//
//  PodcastPlayer.swift
//  CONCEPTO
//
//  Created by cdt307 on 4/5/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import Foundation
import AVFoundation

class PodcastPlayer {
    
    static let sharedInstance = PodcastPlayer()
    
    private var player = AVPlayer()
    private var isPlaying = false
    
    func setURL(url: String){
        player = AVPlayer(url: NSURL(string: url)! as URL)
    }
    
    func play() {
        if(RadioPlayer.sharedInstance.currentlyPlaying()){
            RadioPlayer.sharedInstance.pause()
        }
        player.play()
        isPlaying = true
    }
    
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func forward(){
        let seekTime = player.currentTime() + CMTimeMake(10, 1)
        player.seek(to: seekTime)
    }
    
    func rewind(){
        let seekTime = player.currentTime() - CMTimeMake(10, 1)
        player.seek(to: seekTime)
    }
    
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }
    
    func currentlyPlaying() -> Bool {
        return isPlaying
    }
}
