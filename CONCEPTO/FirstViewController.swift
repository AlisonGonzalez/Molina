//
//  FirstViewController.swift
//  CONCEPTO
//
//  Created by Alfredo on 2/11/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation
import MobileCoreServices

class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var newMedia: Bool?
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var volumeView: MPVolumeView!
    @IBAction func playButtonPressed(_ sender: UIButton) {
        toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            UIApplication.shared.beginReceivingRemoteControlEvents()
        }catch{
            print("Error")
        }
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
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
        playButton.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
        
    }
    
    @IBAction func useCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            newMedia = true
        }
    }
    @IBAction func useCameraRoll(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated : true, completion: nil)
            newMedia = false
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        self.dismiss(animated: true, completion: nil)
        
        if mediaType.isEqual(to: kUTTypeImage as String){
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            imageView.image = image
            if(newMedia == true){
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(FirstViewController.image(image:didFinishSavingWithError:contextInfo:)), nil)
            }else if mediaType.isEqual(to: kUTTypeMovie as String){
                //Video. Tal vez lo haga hoy, tal vez no
                
            }
        }
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafeRawPointer){
        if error != nil{
            let alert = UIAlertController(title: "Error de guardado", message: "No se pudo guardar la imagen", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func share(_ sender: Any) {
        let text = "Escúcha tú también la mejor musica! "
        let url = "www.conceptoradial.com"
        let image = imageView.image
        let objects:[AnyObject]
        if (image != nil){
            objects = [text as AnyObject, url as AnyObject, imageView.image!]
        }else{
            objects = [text as AnyObject, url as AnyObject]
        }
        
        let activities = UIActivityViewController(activityItems : objects, applicationActivities: nil)
        //activities.excludedActivityTypes = [UIActivityType.mail]
        self.present(activities, animated:true, completion:nil)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                RadioPlayer.sharedInstance.rewind()
            case UISwipeGestureRecognizerDirection.left:
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                RadioPlayer.sharedInstance.forward()
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

