//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Banut Raul on 12.07.2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func loadView() {
        mapView = MKMapView()
        
        view = mapView
        
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        
        let segmentedControl = UISegmentedControl(items: [standardString, hybridString, satelliteString])
        
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(
            self,
            action: #selector(mapTypeChanged(_:)),
            for: .valueChanged
        )
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 8
        )
        
        let margins = view.layoutMarginsGuide
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        let labelPointsOfInterests = UILabel()
        labelPointsOfInterests.text = "Points of interests"
        labelPointsOfInterests.textColor = UIColor.black
        
        labelPointsOfInterests.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelPointsOfInterests)
        
        let labelTopConstraint = labelPointsOfInterests.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 12)
        let labelLeadingConstraint = labelPointsOfInterests.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        labelTopConstraint.isActive = true
        labelLeadingConstraint.isActive = true
        
        let switchPointsOfInterests = UISwitch()
        
        switchPointsOfInterests.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(switchPointsOfInterests)
        
        let switchTopConstraint = switchPointsOfInterests.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        let switchLeadingConstraint = switchPointsOfInterests.leadingAnchor.constraint(equalTo: labelPointsOfInterests.trailingAnchor, constant: 8)
        
        switchTopConstraint.isActive = true
        switchLeadingConstraint.isActive = true
        
        switchPointsOfInterests.addTarget(
            self,
            action: #selector(switchChanged(_:)),
            for: .valueChanged
        )
    }
    
    @objc func switchChanged(_ switchController: UISwitch) {
        mapView.pointOfInterestFilter = switchController.isOn ? .excludingAll : .includingAll
    }
    
    @objc func mapTypeChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
        displayUserLocation()
    }
}

extension MapViewController: MKMapViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
        mapView.delegate = self
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        displayUserLocation()
    }
    
    func displayUserLocation() {
        switch locationManager.authorizationStatus {
        case .notDetermined, .restricted, .denied:
            mapView.showsUserLocation = false
        case .authorizedAlways, .authorizedWhenInUse:
            mapView.showsUserLocation = true
            guard let location = locationManager.location else {
                return
            }
            
            let coordinate = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(
                    latitudeDelta: 0.01,
                    longitudeDelta: 0.01
                )
            )
            mapView.setRegion(coordinate, animated: true)
        @unknown default:
            mapView.showsUserLocation = false
        }
    }
}
