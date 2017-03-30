//
//  SocialMedia.swift
//  CONCEPTO
//
//  Created by cdt307 on 3/22/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit

class SocialMedia: UIViewController {

    @IBOutlet var WebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let socialURL = NSURL(string: "https://www.facebook.com/conceptoradial")
        
        WebView.loadRequest(NSURLRequest(url: socialURL as! URL) as URLRequest)
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
