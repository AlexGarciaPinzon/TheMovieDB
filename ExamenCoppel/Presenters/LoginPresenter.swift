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
    func presentToken(token: String)
}

typealias LoginPresenterDelegate = UserPresenterDelegate & UIViewController

class LoginPresenter{
    
    weak var delegate: LoginPresenterDelegate?
    var token = ""
    public func getToken(){
        NetworkinManager.shared.getToken(){
            self.token = $0!
            self.delegate?.presentToken(token: self.token)
        }
    }
    
    public func getSessionId(){
        
    }
    
    public func setViewDelegate(delegate: LoginPresenterDelegate){
        self.delegate = delegate
    }
}
