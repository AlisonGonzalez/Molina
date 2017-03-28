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
    
    fileprivate var reproductor: AVAudioPlayer!
    
    @IBOutlet weak var name: UILabel!

    var link:String = ""
    
    var nombre:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = link

        // Do any additional setup after loading the view.
        
        var createError: NSError?
        let soundURL = NSURL(string: link)
        
        do{
            let sonido = try AVAudioPlayer(contentsOf: soundURL as! URL)
            reproductor = sonido
            
        }catch let error as NSError{
            createError = error
            reproductor = nil
        }
        if reproductor == nil{
            if let error = createError{
                print("Error en audio \(error.localizedDescription)")
            }
        }
        
    }

    @IBAction func reproducir(_ sender: Any) {
        play()
    }
    @IBAction func pausa(_ sender: Any) {
        pause()
    }
    @IBAction func parar(_ sender: Any) {
        stop()
    }
    
    func play() {
        if !reproductor.isPlaying{
            reproductor.play()
        }
    }
    
    func pause() {
        if reproductor.isPlaying{
            reproductor.pause()
        }
    }
    
    func stop() {
        reproductor.stop()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
