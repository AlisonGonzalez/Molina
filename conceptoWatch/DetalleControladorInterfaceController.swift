//
//  DetalleControladorInterfaceController.swift
//  CONCEPTO
//
//  Created by Alfredo on 3/30/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import WatchKit
import Foundation


class DetalleControladorInterfaceController: WKInterfaceController {

    @IBOutlet var titulo: WKInterfaceLabel!
    @IBOutlet var sintesis: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let c = context as! PodcastTable
        
        let texto1=c.nombre
        let texto2=c.descripcion
        titulo.setText(texto1)
        sintesis.setText(texto2)
        
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

}

class PodcastTable {
    var nombre:String
    var descripcion:String
    
    
    init(elnombre:String,ladescripcion:String)
    {
        nombre=elnombre
        descripcion=ladescripcion
    }
    
}
