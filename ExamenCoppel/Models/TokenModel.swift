//
//  TokenModel.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 24/11/21.
//

import Foundation

struct TokenModel: Codable{
    let success: Bool
    let expires_at: String
    let request_token: String
}
