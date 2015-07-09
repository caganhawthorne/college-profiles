//
//  MapViewController.swift
//  Cagan College
//
//  Created by caganhawthorne on 7/8/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var addressField: UITextField!
    
    var address = ""
    let geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressField.text = address
        textFieldShouldReturn(addressField)
        
        /*
        geocoder.geocodeAddressString(address, completionHandler:
            {placemarks, error in
                if error != nil {
                    print(error)
                }
                else {
                    if placemarks!.count == 1{
                        let placemark = placemarks!.first as CLPlacemark!
                        let center = placemark.location.coordinate
                        let span = MKCoordinateSpanMake(0.1, 0.1)
                        self.displayMap(center, span: span, pinTitle: self.addressField.text!)

                    }
                    else {
                        var counter = 0
                        let actionSheet = UIAlertController(title: "Locations", message: nil, preferredStyle: .ActionSheet)
                        
                        while(counter<10 && counter<placemarks!.count) {
                            
                            
                            let action = UIAlertAction(title: String(placemarks![counter]), style: .Default) { (action) -> Void in
                                let placemark = placemarks![counter] as CLPlacemark!
                                let center = placemark.location.coordinate
                                let span = MKCoordinateSpanMake(0.1, 0.1)
                                self.displayMap(center, span: span, pinTitle: self.addressField.text!)
                                
                                }
                            
                        actionSheet.addAction(action)
                        counter++
                        print(String(counter))
                        }
                        
                        
                        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
                            self.dismissViewControllerAnimated(true, completion: nil)
                            
                        }
                        actionSheet.addAction(cancelAction)
                         self.presentViewController(actionSheet, animated: true, completion: nil)
                        
                       

                    }
                }
        })
    
    */
    
    }
    
    
    

    
    
    
    
    func displayMap(center: CLLocationCoordinate2D,
        span: MKCoordinateSpan,
        pinTitle: String) {
            let region = MKCoordinateRegionMake(center, span)
            let pin = MKPointAnnotation()
            pin.coordinate = center
            pin.title = pinTitle
            mapView.addAnnotation(pin)
            mapView.setRegion(region, animated: true)
            self.view.endEditing(true)
            
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
  
        
        geocoder.geocodeAddressString(addressField.text!, completionHandler:
            {placemarks, error in
                if error != nil {
                    print(error)
                }
                    
                else {
                    
                    var placemarkArray : [CLPlacemark] = []
                    if(placemarks!.count>10) {
                        for i in 0...9 {
                        placemarkArray.append(placemarks![i])
                        }
                    }
                    else if(placemarks!.count<=10) {
                        placemarkArray = placemarks!
                    }
                
                
                    
                    if (placemarkArray.count > 1) {
                   
                        
                        let actionSheet = UIAlertController(title: "Select a Location", message: "Select your prefered location", preferredStyle: .ActionSheet)
                        print(placemarkArray.count)
                        
                        for i in placemarkArray {
                            
                            let placemark = i as CLPlacemark!
                            let center = placemark.location.coordinate
                            let span = MKCoordinateSpanMake(0.1, 0.1)
                            
                            let action = UIAlertAction(title: (i.name+", "+i.administrativeArea), style: .Default) { (action) -> Void in
                                
                                self.displayMap(center, span: span, pinTitle: self.addressField.text!)
                                
                        }
                        
                            actionSheet.addAction(action)
                            
                        }
                        
                        
                        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
                            self.dismissViewControllerAnimated(true, completion: nil)
                            
                        }
                        actionSheet.addAction(cancelAction)
                        self.presentViewController(actionSheet, animated: true, completion: nil)
                        
                        
                        
                    }
                    
                    else if placemarkArray.count == 1 {
                        let placemark = placemarkArray.first as CLPlacemark!
                        let center = placemark.location.coordinate
                        let span = MKCoordinateSpanMake(0.1, 0.1)
                        self.displayMap(center, span: span, pinTitle: self.addressField.text!)
                        
                    }

                }
                
        })
        
        return true
        
    }
    
    


    

}
