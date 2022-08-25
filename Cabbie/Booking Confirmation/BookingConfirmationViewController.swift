//
//  BookingConfirmationViewController.swift
//  Cabbie
//
//  Created by Awani Melvyn on 03/08/2022.
//

import UIKit
import MapKit

final class BookingConfirmationViewController: UIViewController{
    
    var location: CLLocation = CLLocation(latitude: 0, longitude: 0)
    private let currentlocationMapDisplay: MKMapView = {
        let map = MKMapView()
        return map
    }()

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        currentlocationMapDisplay.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateMapWithCurrentLocation(location: location)
    }

    public func updateMapWithCurrentLocation(location: CLLocation) {
        currentlocationMapDisplay.centerToLocation(location)
        let destination = MKPointAnnotation()
        destination.title = Constants.destinationAnnotation
        destination.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        currentlocationMapDisplay.addAnnotation(destination)
    }
    
    override func viewDidLayoutSubviews() {
        currentlocationMapDisplay.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentlocationMapDisplay)
        let constraints = [
            currentlocationMapDisplay.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            currentlocationMapDisplay.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            currentlocationMapDisplay.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -260),
            currentlocationMapDisplay.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20)
        ]
        view.addConstraints(constraints)
    }
}

extension BookingConfirmationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VehicleSelectionTableViewCell
        return cell
    }
}

extension BookingConfirmationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Cell was clicked")
    }
}

extension BookingConfirmationViewController: MKMapViewDelegate {
    
}
