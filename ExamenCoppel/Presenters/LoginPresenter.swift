//
//  LoginPresenter.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 24/11/21.
//

import Foundation
import UIKit

protocol UserPresenterDelegate: AnyObject {
    func presentUser(user: UserModel)
}

typealias LoginPresenterDelegate = UserPresenterDelegate & UIViewController

class LoginPresenter{
    
    weak var delegate: LoginPresenterDelegate?
    var requestToken: String?
    
    public func getToken(){
        guard let url = URL(string: "https://api.themoviedb.org/3/authentication/token/new?api_key=e129eae338aa9949fc6a91b416d2331a") else {return}
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else {return}
            print("Inside get token")
            do{
                let tokenInfo =  try JSONDecoder().decode(TokenModel.self, from: data)
                self?.requestToken =  tokenInfo.request_token
                //print(self?.requestToken!)// = response
                //self?.delegate?.presentUser(user: response)
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    public func getSessionId(){
        
    }
    
    public func setViewDelegate(delegate: LoginPresenterDelegate){
        self.delegate = delegate
    }
}
