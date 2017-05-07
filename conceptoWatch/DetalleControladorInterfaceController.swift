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

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let c = context as! PodcastTable2
        
        let texto1=c.nombre
        let texto2=c.descripcion
        
        
        //let s=context as! MarcaAuto
        //let numAgencias=s.agencias
        //let contenidoMarca=s.marca
        //agencias.setText(String(numAgencias))
        //marca.setText(contenidoMarca)

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
