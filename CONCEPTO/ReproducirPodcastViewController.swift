//
//  ReproducirPodcastViewController.swift
//  CONCEPTO
//
//  Created by Alfredo on 3/24/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit
import AVFoundation

class ReproducirPodcastViewController: UIViewController {
    
    
    
    @IBOutlet weak var name: UILabel!

    var nombre:String = ""
    var link:String = ""
    
    var player = AVAudioPlayer()
    
    var sonido:NSURL? = nil
    
    var error = NSError()
    
    var reproduciendo = false
    override func viewWillAppear(_ animated: Bool) {
       name.text = nombre
        sonido = NSURL(string: link)
        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }

    @IBAction func reproducir(_ sender: Any) {
        do{
            player = try AVAudioPlayer(contentsOf:sonido as! URL)
            player.prepareToPlay()
            player.play()
        }catch{
            print(error.localizedDescription)
        }
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
