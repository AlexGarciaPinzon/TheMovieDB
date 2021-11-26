//
//  UserModel.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 24/11/21.
//

import Foundation

struct UserModel: Decodable{
    let name: String
    let password: String
    let email: String
    let sessionId: String
}
