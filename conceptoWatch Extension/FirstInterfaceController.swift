//
//  FirstInterfaceController.swift
//  CONCEPTO
//
//  Created by cdt307 on 4/5/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class FirstInterfaceController: WKInterfaceController {
    @IBOutlet var statusLabel: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    @IBAction func startPlay() {
        if WCSession.default().isReachable == true {
            
            let requestValues = ["command" : "start"]
            let session = WCSession.default()
            
            session.sendMessage(requestValues, replyHandler: { reply in
                self.statusLabel.setText(reply["status"] as? String)
            }, errorHandler: { error in
                print("error: \(error)")
            })
        }
        
    }
    @IBAction func stopPlay() {
        if WCSession.default().isReachable == true {
            
            let requestValues = ["command" : "stop"]
            let session = WCSession.default()
            
            session.sendMessage(requestValues, replyHandler: { reply in
                self.statusLabel.setText(reply["status"] as? String)
            }, errorHandler: { error in
                print("error: \(error)")
            })
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
