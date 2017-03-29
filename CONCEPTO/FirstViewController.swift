//
//  FirstViewController.swift
//  CONCEPTO
//
//  Created by Alfredo on 2/11/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit
import MediaPlayer

class FirstViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBAction func playButtonPressed(_ sender: UIButton) {
        toggle()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func toggle() {
        if RadioPlayer.sharedInstance.currentlyPlaying() {
            pauseRadio()
        } else {
            playRadio()
        }
    }
    
    func playRadio() {
        RadioPlayer.sharedInstance.play()
        playButton.setImage(#imageLiteral(resourceName: "pause"), for: UIControlState.normal)
    }
    
    func pauseRadio() {
        RadioPlayer.sharedInstance.pause()
        playButton.setImage(#imageLiteral(resourceName: "reproducir-1"), for: UIControlState.normal)
        
    }


}

