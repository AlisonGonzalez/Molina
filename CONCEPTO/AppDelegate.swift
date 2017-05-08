//
//  AppDelegate.swift
//  CONCEPTO
//
//  Created by Alfredo on 2/11/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {

    var window: UIWindow?
    var session : WCSession!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UITabBar.appearance().tintColor = UIColor.orange
        UIApplication.shared.statusBarStyle = .lightContent
        
        if (WCSession.isSupported()) {
            session = WCSession.default()
            session.delegate = self
            session.activate()
            
            if session.isPaired != true {
                print("Apple Watch is not paired")
            }
            
            if session.isWatchAppInstalled != true {
                print("WatchKit app is not installed")
            }
        } else {
            print("WatchConnectivity is not supported on this device")
        }
        
        return true
        
    }
   
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func viewWillAppear(animated: Bool){
        if (WCSession.isSupported())
        {
            session = WCSession.default()
            session.delegate = self
            session.activate()
            
        }
    }
    
    //WCSessionProtocol
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        var replyValues = Dictionary<String, AnyObject>()
        //let viewController = self.window!.rootViewController! as UIViewController
        
        switch message["command"] as! String {
        case "start" :
            RadioPlayer.sharedInstance.play()
            replyValues["status"] = "Reproduciendo" as AnyObject?
        case "stop" :
            RadioPlayer.sharedInstance.pause()
            replyValues["status"] = "Detenido" as AnyObject?
        default:
            break
        }
        replyHandler(replyValues)
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState,error: Error?){
        print("")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession){
        print("")
    }
    
    func sessionDidDeactivate( _ session: WCSession){
        print("")
    }

}

