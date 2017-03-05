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
    private var player = AVPlayer(url: NSURL(string: "http://wms.tecnoxia.com:1935/8022/8022/playlist.m3u8")! as URL)
    private var isPlaying = false
    
    func play() {
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
    
    func currentlyPlaying() -> Bool {
        return isPlaying
    }
}
