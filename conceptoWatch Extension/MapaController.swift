//
//  InterfaceController.swift
//  MapasProyecto WatchKit Extension
//
//  Created by Alison on 06/05/17.
//  Copyright © 2015 Tec de Monterrey. All rights reserved.
//

import WatchKit
import Foundation


class MapaController: WKInterfaceController {

    @IBOutlet var mapa: WKInterfaceMap!
    
    @IBAction func hacerZoom(_ value: Float) {
        let grados:CLLocationDegrees=CLLocationDegrees(value)/10
        let ventana=MKCoordinateSpanMake(grados, grados)
        let tec=CLLocationCoordinate2D(latitude: 19.283996, longitude: -99.136006)
        let region=MKCoordinateRegionMake(tec, ventana)
        mapa.setRegion(region)
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        
        let tec=CLLocationCoordinate2D(latitude: 19.283996, longitude: -99.136006)
        let region=MKCoordinateRegion(center:tec, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapa.setRegion(region)
        self.mapa.addAnnotation(tec, with: .purple)

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
