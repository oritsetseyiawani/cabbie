//
//  Constants.swift
//  Cabbie
//
//  Created by Melvyn Awani on 08/07/2022.
//

import Foundation

class Constants{
    static let appName = "🚖 Cabbie"
    static let loginSegue = "LoginToWelcome"
    static let signUpSegue = "SignUpToWelcome"
    static let bookSegue = "WelcomeToBook"
    static let confirmBookingSegue = "BookToBookingConfirmation"
    static let chatCellIdentifier = "chatCell"
    static let chatCellNibName = "MessageTableViewCell"
    static let loginFailMessage = "Incorrect email address or password"
    static let passwordResetSuccess = "A password reset link has been sent to your email address"
    static let passwordResetFail = "Email address entered is not registered, please enter a registered email and then press 'Forgot Password' to reset your password"

    static let didNotTouchTextField = "User did not touch a TextField"
    static let destinationAnnotation = "Destination"
    
    static let welcomeLabelText = "Welcome!"
    static let desiredLocationTextFieldPlaceholder = "Where would you like to go?"
    
    
    static let pickUpAddressTextFieldText = "Current Location"
    

    struct FirebaseStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
