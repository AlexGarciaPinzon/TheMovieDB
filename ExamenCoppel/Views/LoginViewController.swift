//
//  LoginViewController.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 23/11/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func procesandoLogin(_ sender: Any) {
        errorMessageLabel.isHidden = true
        print("Here you can process the login")
        let urlString = ""
        let parametros = ""
        guard let userValue = userNameText.text, let passwordValue = passwordText.text else{
            errorMessageLabel.isHidden = false
            return
        }
        if (userValue == "" || passwordValue == ""){
            errorMessageLabel.isHidden = false
        }
        
        
    }
}

