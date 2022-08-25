//
//  OrderCabViewController.swift
//  Cabbie
//
//  Created by Melvyn Awani on 27/07/2022.
//


import UIKit
import GooglePlaces
import MapKit


final class OrderCabViewController: UIViewController {

    @IBOutlet weak private var toLbl: UILabel!
    @IBOutlet weak private var fromLbl: UILabel!
    private var placesClient: GMSPlacesClient!
    @IBOutlet weak private var pickUpAddressTextField: UITextField!
   @IBOutlet weak private var destinationTextField: UITextField!
    
    var destination: CLLocation = CLLocation(latitude: 0, longitude: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        placesClient = GMSPlacesClient.shared()
        pickUpAddressTextField.text = Constants.pickUpAddressTextFieldText
    }
    
   
    @IBAction func didTapDestinationTextField(_ sender: UITextField) {
        
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        autocompleteController.view.tag = 2

        //SPECIFYING A FILTER
        let filter = GMSAutocompleteFilter()
        filter.type = .establishment
        filter.countries = ["GB"]
        autocompleteController.autocompleteFilter = filter
        
        //Specify the place data types to return
        let fields: GMSPlaceField = [.name , .placeID, .coordinate]
        autocompleteController.placeFields = fields
        
        present(autocompleteController , animated: true , completion: nil)
        
    }
    
    
@IBAction func didTapPickUpAddressTextFieldTouchDown(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        autocompleteController.view.tag = 1
        let filter = GMSAutocompleteFilter()
        filter.type = .establishment
        filter.countries = ["GB"]
        autocompleteController.autocompleteFilter = filter
        //Specify the place data types to return
        let fields: GMSPlaceField = [.name , .placeID]
        autocompleteController.placeFields = fields
        present(autocompleteController , animated: true , completion: nil)
    }
    
}

extension OrderCabViewController: GMSAutocompleteViewControllerDelegate {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        if let name = place.name  {
            switch(viewController.view.tag) {
            case 1:
                pickUpAddressTextField.text = name
            
            case 2:
                destinationTextField.text = name
                destination = CLLocation(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
                performSegue(withIdentifier: Constants.confirmBookingSegue, sender: nil)
                
            default:
                print(Constants.didNotTouchTextField)
            }
            dismiss(animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationController = segue.destination as! BookingConfirmationViewController
        destinationController.location = destination
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: \(error.localizedDescription)")

    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
}
