//
//  ViewController.swift
//  Nano7App
//
//  Created by Igor Samoel da Silva on 16/11/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, UIGestureRecognizerDelegate {
    //pro toque
    var annotation: MKAnnotationView?
    var imagemSatelite: UIImage?
    
    lazy var popUp: UIView = {
        let popUp = UIView(frame: CGRect(x: -300, y: -300, width: 224, height: 200))
        popUp.center = CGPoint(x: 237, y: 83)
        popUp.backgroundColor = .init(red: 54, green: 54, blue: 54, alpha: 0.0011)
        popUp.isHidden = true
        return popUp
    }()
    
    lazy var label: UILabel = {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 260))
        label.center = CGPoint(x: 350, y: 83)
        label.numberOfLines = 12
        label.textAlignment = .left
        label.isHidden = true
        return label
    }()
    
    let annotion = MKPointAnnotation()
    lazy var map : MKMapView = {
        let map = MKMapView()
        map.mapType = .hybridFlyover
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Set initial location in Honolulu)
        
        
        setupContraints()
        
    }
    
    
    
    //Function to adding custom pin
    private func addCustomPin(){
        let pin = MKPointAnnotation()
        pin.title = "ISS here"
        map.addAnnotation(pin)
    }
    
    //function to show custom pin at map
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            
            annotationView?.canShowCallout = true
        }
        else{
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "IssIcon")
        
        self.annotation = annotationView
        self.imagemSatelite = annotationView?.image
        
        if self.annotation != nil{
            self.setupImage(self.annotation!)
            self.annotation?.addSubview(self.popUp)
            self.annotation?.addSubview(self.label)
        }
        
        return annotationView
        
    }
    
    func setupImage(_ annotation: MKAnnotationView){
        let overlay = UIButton(frame: annotation.bounds)
        annotation.isUserInteractionEnabled = true
        overlay.backgroundColor = UIColor.red.withAlphaComponent(0.0)
        overlay.addTarget(self, action: #selector(teste), for: UIControl.Event.touchUpInside)
        annotation.addSubview(overlay)
    }
    

    
    @objc func teste(){
        print("***TOCOU NO PINTO***")
        self.popUp.isHidden.toggle()
        self.label.isHidden.toggle()
    }
    
    
    
    func setupContraints() {
        self.view.addSubview(self.map)
        
        map.translatesAutoresizingMaskIntoConstraints = false
        
        map.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        map.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        map.delegate = self
        
        
        let coordinate = CLLocationCoordinate2D(latitude: -42.618332, longitude: 168.68759)
        annotion.coordinate = coordinate
        
        
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true) { timer in
            IssAPI.shared.request { iss in
                let latitude = Double(iss.latitude)
                let longitude = Double(iss.longitude)
                
                DispatchQueue.main.async {
                    
                    self.annotion.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    self.label.text = "Nome: \(iss.name.uppercased())\nLatitude: \(iss.latitude)\nLongitude: \(iss.longitude)\nAltitude: \(iss.altitude)\nVelocidade: \(iss.velocity)\nVisibilidade: \(iss.visibility)\nPegadas: \(iss.footprint)"
                    
                }
            }
        }
        map.addAnnotation(annotion)
    }
}

