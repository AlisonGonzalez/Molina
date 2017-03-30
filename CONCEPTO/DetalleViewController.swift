//
//  DetalleViewController.swift
//  CONCEPTO
//
//  Created by Irvin Mundo on 20/03/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {

    @IBOutlet weak var laMarca: UILabel!
    var marca:String="VW"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        laMarca.text = marca
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
