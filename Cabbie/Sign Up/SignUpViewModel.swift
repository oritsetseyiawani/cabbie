//
//  SignUpViewModel.swift
//  Cabbie
//
//  Created by Melvyn Awani on 08/07/2022.
//

import Foundation
import FirebaseAuth

protocol SignUpViewModelType {
    func performSignUp(email: String, password: String, completionHandler:@escaping (Bool, String?)->Void)
    
}

class SignUpViewModel: SignUpViewModelType {
    
    private let firebaseNetworkManager: FirebaseNetworkManagerType

      init(firebaseNetworkManager: FirebaseNetworkManagerType){
          self.firebaseNetworkManager = firebaseNetworkManager
     }
 
    func performSignUp(email: String, password: String, completionHandler:@escaping (Bool, String?)->Void) {
        firebaseNetworkManager.performSignUp(email: email, password: password) { response, errorMessage in
            switch response {
            case true:
                completionHandler(true, nil)
            case false:
                completionHandler(false, errorMessage)
            }
            
        }
    }
    
}
