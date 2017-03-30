//
//  SocialButtonsController.swift
//  CONCEPTO
//
//  Created by cdt307 on 3/22/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit

class SocialButtonsController: UIViewController {

    @IBAction func fbButton(_ sender: UIButton) {
        let url = NSURL(string: "https://www.facebook.com/conceptoradial/")
        UIApplication.shared.open(url as! URL)
    }
    @IBAction func twButton(_ sender: UIButton) {
        let url = NSURL(string: "https://twitter.com/conceptoradial")
        UIApplication.shared.open(url as! URL)
    }
    @IBAction func ytButton(_ sender: UIButton) {
        let url = NSURL(string: "https://www.youtube.com/watch?v=H1g3pGEo-TU")
        UIApplication.shared.open(url as! URL)
    }
    @IBAction func webButton(_ sender: UIButton) {
        let url = NSURL(string: "http://www.conceptoradial.com/")
        UIApplication.shared.open(url as! URL)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
