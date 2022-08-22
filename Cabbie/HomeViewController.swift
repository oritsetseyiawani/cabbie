//
//  ViewController.swift
//  Cabbie
//
//  Created by Melvyn Awani on 08/07/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var appNameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        appNameLbl.text = Constants.appName
    }

}

