//
//  ViewController.swift
//  Fizx Field Trip
//
//  Created by jlosurdo on 4/17/17.
//  Copyright © 2017 Jack. All rights reserved.


// test haq

//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate
{
    
    @IBOutlet weak var myMapView: MKMapView!
    let sixFlagsCoordiantes = CLLocationCoordinate2DMake(42.369680, -87.935544)
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myMapView.delegate = self
        addPinToMap()
    }
    
    func addPinToMap()
    {
        let myAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = sixFlagsCoordiantes
        myAnnotation.title = "6 flags"
        myAnnotation.subtitle = "Carousel Plaza"
        myMapView.addAnnotation(myAnnotation)
    }
    
    @IBAction func goToSixFlags(_ sender: Any)
    {
        centerMap(location: sixFlagsCoordiantes)
    }
    func centerMap(location: CLLocationCoordinate2D)
    {
        let mySpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myRegion = MKCoordinateRegion(center: location, span: mySpan)
        myMapView.setRegion(myRegion, animated: true)
    }
    
    
    
}


