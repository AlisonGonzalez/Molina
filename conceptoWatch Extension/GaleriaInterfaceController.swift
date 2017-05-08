//
//  GaleriaInterfaceController.swift
//  CONCEPTO
//
//  Created by Irvin Mundo on 08/05/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class GaleriaInterfaceController: WKInterfaceController {
    
    @IBOutlet var saludo: WKInterfaceLabel!
    @IBOutlet var imagenRecibida: WKInterfaceImage!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        //recieving message from iphone
        self.saludo.setText(message["saluda"]! as? String)
    }
    
    func session(session: WCSession, didReceiveMessageData messageData: Data, replyHandler:  (NSData) -> Void) {
        
        guard let ima = UIImage(data: messageData) else {
            return
        }
        
        // throw to the main queue to upate properly
        DispatchQueue.main.async() { [weak self] in
            
            self?.imagenRecibida.setImage(ima)// update your UI here
        }
        
        replyHandler(messageData as NSData)
    }
    
}
