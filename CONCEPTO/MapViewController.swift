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
    
    //mapa acerca de
    @IBOutlet weak var mapa: MKMapView!
    
    //mapa eventos 1
    @IBOutlet weak var mapaEventos1: MKMapView!
    
    
    //mapa eventos 2
    @IBOutlet weak var mapaEventos2: MKMapView!
    
    
    let locationManager = CLLocationManager()
    
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
        
        
        //mapa eventos 2
        mapaEventos1.mapType=MKMapType.standard
        //coordendas foro sol
        let cl2=CLLocationCoordinate2DMake(19.404889, -99.095944)
        mapaEventos1.region=MKCoordinateRegionMakeWithDistance(cl2, 10, 10)
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
            mapa.showsUserLocation = true
            mapaEventos1.showsUserLocation = true
            mapaEventos2.showsUserLocation = true
        } else {
            locationManager.stopUpdatingLocation()
            mapa.showsUserLocation = false
            mapaEventos1.showsUserLocation = false
            mapaEventos2.showsUserLocation = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
