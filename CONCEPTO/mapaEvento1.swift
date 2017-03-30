//
//  MapViewController.swift
//  CONCEPTO
//
//  Created by Emiliano Cervantes on 22/03/17.
//  Copyright © 2017 Emiliano. All rights reserved.
//

import MapKit
import CoreLocation
import UIKit

class mapaEvento1: UIViewController,CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapaEventos1: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1000.0
        locationManager.requestWhenInUseAuthorization()
        
        
        //mapa eventos 1
        mapaEventos1.mapType=MKMapType.standard
        //coordenadas auditorio nacional
        let cl1=CLLocationCoordinate2DMake(19.424722, -99.194917)
        mapaEventos1.region=MKCoordinateRegionMakeWithDistance(cl1, 10, 10)
        var punto1 = CLLocationCoordinate2D()
        punto1.latitude = 19.424722
        punto1.longitude = -99.194917
        let pin1 = MKPointAnnotation()
        pin1.coordinate = punto1
        pin1.title = "Björk en CDMX"
        pin1.subtitle = "Auditorio Nacional"
        mapaEventos1.addAnnotation(pin1)
        
        mapaEventos1.showsCompass=true
        mapaEventos1.showsScale=true
        mapaEventos1.showsTraffic=true
        mapaEventos1.isZoomEnabled=true
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
            mapaEventos1.showsUserLocation = true
        } else {
            locationManager.stopUpdatingLocation()
            mapaEventos1.showsUserLocation = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
