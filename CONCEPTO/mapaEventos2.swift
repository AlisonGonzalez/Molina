//
//  MapViewController.swift
//  CONCEPTO
//
//  Created by Irvin Mundo on 22/03/17.
//  Copyright © 2017 Emiliano. All rights reserved.
//

import MapKit
import CoreLocation
import UIKit

class mapEventos2: UIViewController,CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapaEventos2: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1000.0
        locationManager.requestWhenInUseAuthorization()
        
        //mapa eventos 2
        mapaEventos2.mapType=MKMapType.standard
        
        //coordendas foro sol
        let cl2=CLLocationCoordinate2DMake(19.404889, -99.095944)
        mapaEventos2.region=MKCoordinateRegionMakeWithDistance(cl2, 10, 10)
        var punto2 = CLLocationCoordinate2D()
        punto2.latitude = 19.404889
        punto2.longitude = -99.095944
        let pin2 = MKPointAnnotation()
        pin2.coordinate = punto2
        pin2.title = "Depeche Mode en México"
        pin2.subtitle = "Foro Sol"
        mapaEventos2.addAnnotation(pin2)
        
        mapaEventos2.showsCompass=true
        mapaEventos2.showsScale=true
        mapaEventos2.showsTraffic=true
        mapaEventos2.isZoomEnabled=true
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
            mapaEventos2.showsUserLocation = true
        } else {
            locationManager.stopUpdatingLocation()
            mapaEventos2.showsUserLocation = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
