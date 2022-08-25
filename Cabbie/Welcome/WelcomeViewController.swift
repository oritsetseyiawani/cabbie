//
//  WelcomeViewController.swift
//  Cabbie
//
//  Created by Melvyn Awani on 01/08/2022.
//

import UIKit
import CoreLocation
import MapKit

final class WelcomeViewController: UIViewController {
    
    let manager = CLLocationManager()
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.welcomeLabelText
        label.textColor = .label
        return label
    }()
    
    private let desiredLocationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.desiredLocationTextFieldPlaceholder
        textField.textColor = .label
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        return textField
    }()
    
    private let currentlocationMapDisplay: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        addSubviews()
        view.backgroundColor = .systemBackground
        desiredLocationTextField.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.startUpdatingLocation()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        welcomeLabel.frame = CGRect(x: 25, y: view.safeAreaInsets.top+25, width: view.frame.size.width, height: 20)
        desiredLocationTextField.frame = CGRect(x: 25, y: welcomeLabel.bottom+10, width: view.width-50, height: 34)
        currentlocationMapDisplay.frame = CGRect(x: 25, y: desiredLocationTextField.bottom+20, width: view.width-50, height: view.bottom-210 )
    }
    
    public func addSubviews() {
        view.addSubview(welcomeLabel)
        view.addSubview(desiredLocationTextField)
        view.addSubview(currentlocationMapDisplay)
    }
    
    @IBAction func didTapLogOut(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

extension WelcomeViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        updateMapWithCurrentLocation(location: location)
        manager.stopUpdatingLocation()
    }
    
    public func updateMapWithCurrentLocation(location: CLLocation) {
        currentlocationMapDisplay.centerToLocation(location)
        let destination = MKPointAnnotation()
        destination.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        currentlocationMapDisplay.addAnnotation(destination)
        currentlocationMapDisplay.tintColor = UIColor.blue
    }
}

extension WelcomeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        desiredLocationTextField.resignFirstResponder()
        if (textField.placeholder ==  Constants.desiredLocationTextFieldPlaceholder){
            performSegue(withIdentifier: Constants.bookSegue, sender: nil)
        }
    }
}

extension MKMapView {
    func centerToLocation(_ location: CLLocation,regionRadius: CLLocationDistance = 300) {
        let coordinateRegion = MKCoordinateRegion( center: location.coordinate,latitudinalMeters: regionRadius, longitudinalMeters:regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
