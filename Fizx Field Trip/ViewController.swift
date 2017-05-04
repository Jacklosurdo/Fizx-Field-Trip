//
//  ViewController.swift
//  Fizx Field Trip
//
//  Created by jlosurdo on 4/17/17.
//  Copyright © 2017 Jack. All rights reserved.


// test haq

// hi

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate
{
    @IBAction func pageVCButton(_ sender: Any) {
        performSegue(withIdentifier: "pageVCButton", sender: self)
    }
    
    @IBOutlet weak var myMapView: MKMapView!
    let sixFlagsCoordiantes = CLLocationCoordinate2DMake(42.369680, -87.935544)
    let sixFlagsDemon = CLLocationCoordinate2DMake(42.366404, -87.935024)
    var locationManager = CLLocationManager.init()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        
        myMapView.delegate = self
        addPinToMap()
        goToCurrentLocation()
        //centerMap(location: sixFlagsCoordiantes)
    }
    
    func addPinToMap()
    {
        let myPlaza = MKPointAnnotation()
        myPlaza.coordinate = sixFlagsCoordiantes
        myPlaza.title = "6 flags"
        myPlaza.subtitle = "Carousel Plaza"
        myMapView.addAnnotation(myPlaza)
        let myDemon = MKPointAnnotation()
        myDemon.coordinate = sixFlagsDemon
        myDemon.title = "Demon"
        myDemon.subtitle = "Questions #-#"
        myMapView.addAnnotation(myDemon)
    }
    
    @IBAction func goToSixFlags(_ sender: Any)
    {
        centerMap(location: sixFlagsCoordiantes)
    }
    
    func goToCurrentLocation()
    {
        let span = MKCoordinateSpan.init(latitudeDelta: 0.0075, longitudeDelta: 0.0075)
        let region = MKCoordinateRegion.init(center: (locationManager.location?.coordinate)!, span: span)
        myMapView.setRegion(region, animated: true)
    }
    
    func centerMap(location: CLLocationCoordinate2D)
    {
        let mySpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myRegion = MKCoordinateRegion(center: location, span: mySpan)
        myMapView.setRegion(myRegion, animated: true)
    }
    
    
    
}


