//
//  SignUpViewController.swift
//  Cabbie
//
//  Created by Melvyn Awani on 08/07/2022.
//

import UIKit

final class SignUpViewController: UIViewController {

    let signUpViewModel: SignUpViewModelType = SignUpViewModel(firebaseNetworkManager: FirebaseNetworkManager())
    
    
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))

    }
    
    @objc private func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
        if let email = emailTextField.text , let password = passwordTextField.text{
            signUpViewModel.performSignUp(email: email, password: password) { response, errorMessage in
                if (response == true){
                    self.performSegue(withIdentifier: Constants.signUpSegue, sender: nil)
                }
                else if (response == false){
                    let alertController = UIAlertController(title: "⚠️", message: errorMessage, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

}
