//
//  RadioPlayer.swift
//  Radio
//
//  Created by Alison Gonzalez on 2/11/17.
//  Copyright © 2017 Alison Gonzalez. All rights reserved.
//

import Foundation
import AVFoundation

class RadioPlayer {
    
    static let sharedInstance = RadioPlayer()
    
    private var player = AVPlayer(url: NSURL(string: "http://204.12.193.98:8139/listen.pls")! as URL)
    private var isPlaying = false
    
    func play() {
        if(PodcastPlayer.sharedInstance.currentlyPlaying()){
            PodcastPlayer.sharedInstance.pause()
        }
        player.play()
        isPlaying = true
    }
    
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }
    
    func forward(){
        let seekTime = player.currentTime() + CMTimeMake(10, 1)
        player.seek(to: seekTime)
    }
    
    func rewind(){
        let seekTime = player.currentTime() - CMTimeMake(10, 1)
        player.seek(to: seekTime)
    }
    
    func currentlyPlaying() -> Bool {
        return isPlaying
    }
}
