//
//  LoginViewController.swift
//  Cabbie
//
//  Created by Melvyn Awani on 08/07/2022.
//

import UIKit

final class LoginViewController: UIViewController {

    let loginViewModel: LoginViewModelType = LoginViewModel(firebaseNetworkManager: FirebaseNetworkManager())
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    @objc private func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func didTapForgotPassword(_ sender: Any) {
        
        if let email = emailTextField.text {
            loginViewModel.forgotPassword(email: email) { response in
                switch response {
                case true:
                    let alertController = UIAlertController(title: "🔔", message: Constants.passwordResetSuccess , preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)

                default:
                    let alertController = UIAlertController(title: "🔔", message: Constants.passwordResetFail, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
         
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            loginViewModel.performLogin(email: email, password: password) { response in
                
                switch response {
                case true:
                    self.performSegue(withIdentifier: Constants.loginSegue, sender: UIButton.self)

                default:
                    let alertController = UIAlertController(title: "⚠️", message: Constants.loginFailMessage, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
             
        }
    }
}
