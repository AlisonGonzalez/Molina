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
    private var player = AVPlayer(url: NSURL(string: "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http%3A%2F%2Fus1.internet-radio.com%3A8105%2Flisten.pls&t=.m3u")! as URL)
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
