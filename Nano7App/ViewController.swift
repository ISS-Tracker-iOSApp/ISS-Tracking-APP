//
//  ViewController.swift
//  Nano7App
//
//  Created by Igor Samoel da Silva on 16/11/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,UIGestureRecognizerDelegate {
    var pinsPlaced: [MKPointAnnotation] = []
    //pro toque
    var issAnnotationView: MKAnnotationView?
    let issPointAnnotation = MKPointAnnotation()
    var imagemSatelite: UIImage?
    var isPin: Bool = false
    let locationManager = CLLocationManager()

    
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
    
    
    lazy var map : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupContraints()
        changeMapButton()
        
        //Add MapView Delegate
        map.delegate = self
        
        //Add LocationManager Delegate
        locationManager.delegate = self
        
        updateIssLocation()
        setISSRegion()
        configureLocation()
        
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(recognizeLongPress(_:)))
        tap.minimumPressDuration = 0.5
        
        map.addGestureRecognizer(tap)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // show iss regin in map
        setISSRegion()
    }

    
    @objc private func recognizeLongPress(_ sender: UILongPressGestureRecognizer) {
        for pin in pinsPlaced {
            map.removeAnnotation(pin)
        }
        guard sender.state != UIGestureRecognizer.State.began else{
            return
        }
        let location = sender.location(in: map)
        let myCoordinate: CLLocationCoordinate2D = map.convert(location, toCoordinateFrom: map)
        
        //let teste: MKMarkerAnnotationView = MKMarkerAnnotationView()
        
        let myPin: MKPointAnnotation = MKPointAnnotation()
        myPin.coordinate = myCoordinate
        myPin.title = "Pin"
        

        self.pinsPlaced.append(myPin)
        map.addAnnotation(myPin)
        self.isPin.toggle()
       }
    
    
    ///Method that center in iss location
    private func setISSRegion() {
        self.map.setRegion(MKCoordinateRegion(center: self.issPointAnnotation.coordinate, latitudinalMeters: CLLocationDistance(8000000), longitudinalMeters: 8000000), animated: true)
    }
    
    
    private func configureLocation() {
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.requestLocation()
            self.locationManager.requestAlwaysAuthorization()
            self.locationManager.startUpdatingLocation()
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.allowsBackgroundLocationUpdates = true
            self.map.showsUserLocation = true
        }
        
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
    
    @objc func buttonAction(button: UIButton){
        if map.mapType == .hybridFlyover {
            map.mapType = .standard
        }else{
            map.mapType = .hybridFlyover
        }
        
    }
    
    func changeMapButton(){
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.setTitle("🌎", for: .normal)
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        //Button constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    
    private func updateIssLocation() {
        
        IssAPI.shared.request { iss in
            DispatchQueue.main.async {
                self.issPointAnnotation.coordinate = iss.getCoordinate()
                self.setISSRegion()
            }
        }
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true) { timer in
            IssAPI.shared.request { iss in
                DispatchQueue.main.async {
                    self.issPointAnnotation.coordinate = iss.getCoordinate()
                    self.label.text = "Nome: \(iss.name.uppercased())\nLatitude: \(iss.latitude)\nLongitude: \(iss.longitude)\nAltitude: \(iss.altitude)\nVelocidade: \(iss.velocity)\nVisibilidade: \(iss.visibility)\nPegadas: \(iss.footprint)\n"
                        self.updateOrbitPathOverlays()
                }
            }
        }
        
        map.addAnnotation(issPointAnnotation)
    }
    
    
    
    
    
    
    func updateOrbitPathOverlays() {
        
        //Create overlay: https://stackoverflow.com/questions/44581445/how-to-plot-satellite-ground-track-on-to-a-map-projection-in-swift
       
        IssAPI.shared.requestISSOrbit { locations in
            var coordinates: [CLLocationCoordinate2D] = []
            locations.forEach { location in
                coordinates.append(location.getCoordinate())
            }
            let polyline = MKGeodesicPolyline(coordinates: coordinates, count: coordinates.count)
            DispatchQueue.main.async {
                self.map.removeOverlays(self.map.overlays)
                self.map.addOverlay(polyline)
            }
            
        }
        
    }
    
    
    
    func setupContraints() {
        self.view.addSubview(self.map)
        
        map.translatesAutoresizingMaskIntoConstraints = false
        
        map.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        map.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    }
}


extension ViewController: MKMapViewDelegate {
    
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
        
        if self.isPin{
            annotationView?.image = UIImage(named: "cosmonauta")
            self.isPin.toggle()
        }else{
            annotationView?.image = UIImage(named: "IssIcon")
            self.issAnnotationView = annotationView
            self.imagemSatelite = annotationView?.image
        }
        
        if self.issAnnotationView != nil{
            self.setupImage(self.issAnnotationView!)
            self.issAnnotationView?.addSubview(self.popUp)
            self.issAnnotationView?.addSubview(self.label)
        }
        
        return annotationView
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKGeodesicPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.red
            polylineRenderer.lineWidth = 2
            return polylineRenderer
        }
        return MKOverlayRenderer()
    }
}


extension ViewController: CLLocationManagerDelegate {
    //New Locations from user device
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    
    //Resquest location fail
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint("Erro")
    }
    
    
}
