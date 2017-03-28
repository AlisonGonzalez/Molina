//
//  MapViewController.swift
//  CONCEPTO
//
//  Created by Irvin Mundo on 22/03/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import MapKit
import CoreLocation
import UIKit

class MapViewController: UIViewController,CLLocationManagerDelegate {
    
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1000.0
        locationManager.requestWhenInUseAuthorization()
        
        
        mapa.mapType=MKMapType.standard
        let cl=CLLocationCoordinate2DMake(19.283996, -99.136006)
        mapa.region=MKCoordinateRegionMakeWithDistance(cl, 10, 10)
        var punto = CLLocationCoordinate2D()
        punto.latitude = 19.283996
        punto.longitude = -99.136006
        let pin = MKPointAnnotation()
        pin.coordinate = punto
        pin.title = "Tec CCM"
        pin.subtitle = "Tlalpan"
        mapa.addAnnotation(pin)
        
        
        mapa.showsCompass=true
        mapa.showsScale=true
        mapa.showsTraffic=true
        mapa.isZoomEnabled=true
        
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
            mapa.showsUserLocation = true
        } else {
            locationManager.stopUpdatingLocation()
            mapa.showsUserLocation = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
