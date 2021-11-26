//
//  LoginViewController.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 23/11/21.
//

import UIKit

class LoginViewController: UIViewController, UserPresenterDelegate {
   
    private let loginPresenter = LoginPresenter()
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //En caso de descargar alguna imagen o información antes, puede ir aquí
    }
    
    @IBAction func procesandoLogin(_ sender: Any) {
        errorMessageLabel.isHidden = true
        print("Here you can process the login")
        //Estas validaciones se pueden mejorar con expresiones regulares o validando con los usuario registrados
        guard let userValue = userNameText.text, let passwordValue = passwordText.text else{
            errorMessageLabel.isHidden = false
            return
        }
        if (userValue == "" || passwordValue == ""){
            errorMessageLabel.isHidden = false
        }else{
            loginPresenter.getToken()
            performSegue(withIdentifier: "goToTvCatalog", sender: self)
        }
    }
    
    //PresenterLoginMethods
    func presentUser(user: UserModel) {
        
    }
    func presentToken(token: String) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.dismiss(animated: true, completion: nil)
        
        if segue.identifier == "goToTvCatalog"{
            if let tvShowVC = segue.destination as? TvShowsViewController{
                //Pasar algun dato
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
